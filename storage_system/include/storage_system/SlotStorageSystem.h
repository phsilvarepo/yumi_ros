#ifndef _SLOT_STORAGE_SYSTEM_H_
#define _SLOT_STORAGE_SYSTEM_H_

#include <ros/ros.h>

#include <string>
#include <vector>
#include <cstdint>

#include "storage_system/SPL.h"
#include "storage_system/GetSlot.h"
#include "storage_system/SetSPL.h"
#include "storage_system/GetSPL.h"
#include "storage_system/RemoveSPL.h"
#include "storage_system/UpdateSPLState.h"
#include "storage_system/GetSPLState.h"
#include "storage_system/GetNextSPL.h"

namespace storage_system
{

/**
 * @brief A single slot's occupancy state.
 *
 * Pure inventory data — no TF, no pose, no MoveIt involvement (see SPECS
 * doc, Decisions Log #6/#7). `occupied == false` means the slot is empty.
 */
struct SlotEntry
{
	bool occupied = false;
	int32_t id = -1;
	std::string state;
};

/**
 * @brief Generic, config-driven Slot-based StorageSystem.
 *
 * A single shared class (see SPECS doc, Decisions Log #5) used for all
 * storage kinds directed (Eurocontainer, Redboard, Gripper), each launched
 * as its own node instance, differing only by ROS params:
 *   ~capacity     (int, required)      number of slots (40 / 8 / 1)
 *   ~storage_id   (string, required)   human-readable id for logging,
 *                                      e.g. "eurocontainer_left"
 *   ~valid_states (string[], optional) if non-empty, states outside this
 *                                      list are rejected on SetSPL/
 *                                      UpdateSPLState with Result.INVALID_STATE
 *   ~ascending_order (bool, optional, default true) slot scan direction used
 *                                      by GetNextSPL (and GetSlot's free-slot
 *                                      search): true scans 0->N-1, false
 *                                      scans N-1->0. Static config, no live
 *                                      TF/geometry — mirrors the reference
 *                                      repo's `get_minitray_order` pattern.
 *                                      See SPECS doc, Decisions Log #10.
 *
 * Deliberately holds NO TF publishers and makes NO calls to MoveIt/the
 * planning scene — this is a pure inventory/data service. Geometry (where a
 * slot physically is) is always answered by something else (existing
 * static URDF/xacro TF frames, or MoveIt's attached-object pose while an
 * SPL is in-gripper) — see SPECS doc Section 8 for the full reasoning.
 *
 * Item type (`SPL`) is kept as an isolated concern (own message, own
 * services) so that a future extension to other item types (e.g. treating
 * an EuroContainer or Redboard itself as a storable item in some
 * higher-level registry) does not require restructuring this class — see
 * SPECS doc, Decisions Log #5.
 */
class SlotStorageSystem
{
	public:
		SlotStorageSystem();
		~SlotStorageSystem();

		/**
		 * @brief Spins the node. Purely reactive (service callbacks only) —
		 * no polling loop, no TF broadcasting, no periodic publishing.
		 */
		void run();

	private:
		ros::NodeHandle m_nh;
		ros::NodeHandle m_pnh; /*!< \brief Private NodeHandle for ~params */

		std::string m_storage_id;			/*!< \brief e.g. "eurocontainer_left", for logging */
		int m_capacity;						/*!< \brief Number of slots */
		std::vector<std::string> m_valid_states;	/*!< \brief If non-empty, restricts accepted states */
		bool m_ascending_order;				/*!< \brief Slot scan direction for GetNextSPL (true: 0->N, false: N->0). See SPECS doc, Decisions Log #10 */
		std::vector<SlotEntry> m_slots;		/*!< \brief Slot occupancy table, size == m_capacity */

		ros::ServiceServer m_getSlotSrv;
		ros::ServiceServer m_setSPLSrv;
		ros::ServiceServer m_getSPLSrv;
		ros::ServiceServer m_removeSPLSrv;
		ros::ServiceServer m_updateStateSrv;
		ros::ServiceServer m_getStateSrv;
		ros::ServiceServer m_getNextSPLSrv;

		/**
		 * @brief GetSlot callback — returns the first free (unoccupied) slot index.
		 * Sets Result.STORAGE_FULL if no free slot exists.
		 */
		bool getSlotClbk(GetSlot::Request &req, GetSlot::Response &res);

		/**
		 * @brief SetSPL callback — places an SPL into a specific slot index.
		 * Sets Result.SLOT_OUT_OF_BOUNDS / Result.SLOT_OCCUPIED / Result.INVALID_STATE as applicable.
		 */
		bool setSPLClbk(SetSPL::Request &req, SetSPL::Response &res);

		/**
		 * @brief GetSPL callback — PEEK ONLY, does not modify storage state.
		 * Looks up by slot index (req.slot >= 0) or by SPL id (req.id >= 0, req.slot == -1).
		 */
		bool getSPLClbk(GetSPL::Request &req, GetSPL::Response &res);

		/**
		 * @brief RemoveSPL callback — POP, explicitly empties a slot.
		 * Kept separate from GetSPL by design (SPECS doc Decisions Log #8).
		 */
		bool removeSPLClbk(RemoveSPL::Request &req, RemoveSPL::Response &res);

		/**
		 * @brief UpdateSPLState callback — updates the state of an SPL already
		 * present in this storage, searched by id.
		 */
		bool updateStateClbk(UpdateSPLState::Request &req, UpdateSPLState::Response &res);

		/**
		 * @brief GetSPLState callback — queries the state of an SPL, by id or by slot.
		 */
		bool getStateClbk(GetSPLState::Request &req, GetSPLState::Response &res);

		/**
		 * @brief GetNextSPL callback — PEEK ONLY. Pick-loop entry point: returns
		 * the first occupied slot whose SPL state matches req.state, scanned in
		 * the statically configured ~ascending_order direction (SPECS doc,
		 * Decisions Log #10). Sets Result.ITEM_NOT_FOUND if no occupied slot
		 * matches the requested state.
		 */
		bool getNextSPLClbk(GetNextSPL::Request &req, GetNextSPL::Response &res);

		/**
		 * @brief Finds the slot index currently holding the SPL with the given id.
		 * @return slot index, or -1 if not found.
		 */
		int findSlotById(int32_t id) const;

		/**
		 * @brief Checks whether a state string is acceptable, per m_valid_states
		 * (always true if m_valid_states is empty, i.e. no restriction configured).
		 */
		bool isValidState(const std::string &state) const;
};

};

#endif /*_SLOT_STORAGE_SYSTEM_H_*/
