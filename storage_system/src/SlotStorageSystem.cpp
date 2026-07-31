#include "storage_system/SlotStorageSystem.h"

#include <algorithm>

namespace storage_system
{

SlotStorageSystem::SlotStorageSystem()
	: m_nh()
	, m_pnh("~")
	, m_capacity(0)
{
	/** @prm ~storage_id (string, required) Human-readable id for logging, e.g. "eurocontainer_left" */
	if(!m_pnh.getParam("storage_id", m_storage_id))
	{
		m_storage_id = "unnamed_storage";
		ROS_WARN_STREAM("[storage_system] ~storage_id not set, defaulting to '" << m_storage_id << "'");
	}

	/** @prm ~capacity (int, required) Number of slots in this storage */
	if(!m_pnh.getParam("capacity", m_capacity) || m_capacity <= 0)
	{
		m_capacity = 1;
		ROS_WARN_STREAM("[" << m_storage_id << "] ~capacity not set (or invalid), defaulting to " << m_capacity);
	}

	/** @prm ~valid_states (string[], optional) If non-empty, restricts accepted SPL states */
	m_pnh.getParam("valid_states", m_valid_states);

	/** @prm ~ascending_order (bool, optional, default true) Slot scan direction for
	 * GetNextSPL/GetSlot (true: 0->N-1, false: N-1->0). Static config, no live TF/geometry —
	 * mirrors the reference repo's `get_minitray_order` pattern. See SPECS doc, Decisions Log #10. */
	m_ascending_order = true;
	m_pnh.getParam("ascending_order", m_ascending_order);

	m_slots.resize(m_capacity);

	m_getSlotSrv     = m_nh.advertiseService("get_slot",         &SlotStorageSystem::getSlotClbk,    this);
	m_setSPLSrv      = m_nh.advertiseService("set_spl",          &SlotStorageSystem::setSPLClbk,     this);
	m_getSPLSrv      = m_nh.advertiseService("get_spl",          &SlotStorageSystem::getSPLClbk,     this);
	m_removeSPLSrv   = m_nh.advertiseService("remove_spl",       &SlotStorageSystem::removeSPLClbk,  this);
	m_updateStateSrv = m_nh.advertiseService("update_spl_state", &SlotStorageSystem::updateStateClbk, this);
	m_getStateSrv    = m_nh.advertiseService("get_spl_state",    &SlotStorageSystem::getStateClbk,   this);
	m_getNextSPLSrv  = m_nh.advertiseService("get_next_spl",     &SlotStorageSystem::getNextSPLClbk, this);

	ROS_INFO_STREAM("[" << m_storage_id << "] StorageSystem online. Capacity: " << m_capacity
		<< (m_valid_states.empty() ? " (no state restriction)" : ""));
}

SlotStorageSystem::~SlotStorageSystem()
{
	ROS_INFO_STREAM("[" << m_storage_id << "] Shutting down...");
}

void SlotStorageSystem::run()
{
	ros::spin();
}

int SlotStorageSystem::findSlotById(int32_t id) const
{
	for(size_t i = 0; i < m_slots.size(); ++i)
	{
		if(m_slots[i].occupied && m_slots[i].id == id)
			return static_cast<int>(i);
	}
	return -1;
}

bool SlotStorageSystem::isValidState(const std::string &state) const
{
	if(m_valid_states.empty())
		return true;

	return std::find(m_valid_states.begin(), m_valid_states.end(), state) != m_valid_states.end();
}

bool SlotStorageSystem::getSlotClbk(GetSlot::Request &req, GetSlot::Response &res)
{
	for(size_t k = 0; k < m_slots.size(); ++k)
	{
		size_t i = m_ascending_order ? k : (m_slots.size() - 1 - k);
		if(!m_slots[i].occupied)
		{
			res.slots.push_back(static_cast<int32_t>(i));
			res.result.value = storage_system::Result::NONE;
			return true;
		}
	}

	ROS_WARN_STREAM("[" << m_storage_id << "] GetSlot: storage full (capacity " << m_capacity << ")");
	res.result.value = storage_system::Result::STORAGE_FULL;
	res.result.message = "No free slot available";
	return true;
}

bool SlotStorageSystem::setSPLClbk(SetSPL::Request &req, SetSPL::Response &res)
{
	if(req.slot < 0 || req.slot >= m_capacity)
	{
		ROS_ERROR_STREAM("[" << m_storage_id << "] SetSPL: slot " << req.slot
			<< " out of bounds (capacity " << m_capacity << ")");
		res.success = false;
		res.result.value = storage_system::Result::SLOT_OUT_OF_BOUNDS;
		res.result.message = "Requested slot out of bounds";
		return true;
	}

	if(m_slots[req.slot].occupied)
	{
		ROS_ERROR_STREAM("[" << m_storage_id << "] SetSPL: slot " << req.slot << " already occupied by SPL "
			<< m_slots[req.slot].id);
		res.success = false;
		res.result.value = storage_system::Result::SLOT_OCCUPIED;
		res.result.message = "Slot already occupied";
		return true;
	}

	if(!isValidState(req.spl.state))
	{
		ROS_ERROR_STREAM("[" << m_storage_id << "] SetSPL: state '" << req.spl.state << "' is not valid");
		res.success = false;
		res.result.value = storage_system::Result::INVALID_STATE;
		res.result.message = "Requested SPL state is not valid";
		return true;
	}

	m_slots[req.slot].occupied = true;
	m_slots[req.slot].id = req.spl.id;
	m_slots[req.slot].state = req.spl.state;

	ROS_INFO_STREAM("[" << m_storage_id << "] SPL " << req.spl.id << " (" << req.spl.state
		<< ") set on slot " << req.slot);

	res.success = true;
	res.result.value = storage_system::Result::NONE;
	return true;
}

bool SlotStorageSystem::getSPLClbk(GetSPL::Request &req, GetSPL::Response &res)
{
	int slot = req.slot;

	if(slot < 0)
	{
		slot = findSlotById(req.id);
		if(slot < 0)
		{
			res.found = false;
			res.result.value = storage_system::Result::ITEM_NOT_FOUND;
			res.result.message = "No SPL found with the requested id";
			return true;
		}
	}
	else if(slot >= m_capacity)
	{
		res.found = false;
		res.result.value = storage_system::Result::SLOT_OUT_OF_BOUNDS;
		res.result.message = "Requested slot out of bounds";
		return true;
	}

	if(!m_slots[slot].occupied)
	{
		res.found = false;
		res.result.value = storage_system::Result::SLOT_EMPTY;
		res.result.message = "Requested slot is empty";
		return true;
	}

	res.slot = slot;
	res.spl.id = m_slots[slot].id;
	res.spl.state = m_slots[slot].state;
	res.found = true;
	res.result.value = storage_system::Result::NONE;
	return true;
}

bool SlotStorageSystem::removeSPLClbk(RemoveSPL::Request &req, RemoveSPL::Response &res)
{
	if(req.slot < 0 || req.slot >= m_capacity)
	{
		ROS_ERROR_STREAM("[" << m_storage_id << "] RemoveSPL: slot " << req.slot
			<< " out of bounds (capacity " << m_capacity << ")");
		res.success = false;
		res.result.value = storage_system::Result::SLOT_OUT_OF_BOUNDS;
		res.result.message = "Requested slot out of bounds";
		return true;
	}

	if(!m_slots[req.slot].occupied)
	{
		ROS_WARN_STREAM("[" << m_storage_id << "] RemoveSPL: slot " << req.slot << " is already empty");
		res.success = false;
		res.result.value = storage_system::Result::SLOT_EMPTY;
		res.result.message = "Slot is already empty";
		return true;
	}

	ROS_INFO_STREAM("[" << m_storage_id << "] SPL " << m_slots[req.slot].id << " removed from slot " << req.slot);

	m_slots[req.slot] = SlotEntry();

	res.success = true;
	res.result.value = storage_system::Result::NONE;
	return true;
}

bool SlotStorageSystem::updateStateClbk(UpdateSPLState::Request &req, UpdateSPLState::Response &res)
{
	int slot = findSlotById(req.id);
	if(slot < 0)
	{
		ROS_ERROR_STREAM("[" << m_storage_id << "] UpdateSPLState: SPL " << req.id << " not found");
		res.success = false;
		res.result.value = storage_system::Result::ITEM_NOT_FOUND;
		res.result.message = "No SPL found with the requested id";
		return true;
	}

	if(!isValidState(req.state))
	{
		ROS_ERROR_STREAM("[" << m_storage_id << "] UpdateSPLState: state '" << req.state << "' is not valid");
		res.success = false;
		res.result.value = storage_system::Result::INVALID_STATE;
		res.result.message = "Requested SPL state is not valid";
		return true;
	}

	ROS_INFO_STREAM("[" << m_storage_id << "] SPL " << req.id << " state updated: "
		<< m_slots[slot].state << " -> " << req.state);

	m_slots[slot].state = req.state;

	res.success = true;
	res.result.value = storage_system::Result::NONE;
	return true;
}

bool SlotStorageSystem::getStateClbk(GetSPLState::Request &req, GetSPLState::Response &res)
{
	int slot = req.slot;

	if(slot < 0)
	{
		slot = findSlotById(req.id);
		if(slot < 0)
		{
			res.found = false;
			res.result.value = storage_system::Result::ITEM_NOT_FOUND;
			res.result.message = "No SPL found with the requested id";
			return true;
		}
	}
	else if(slot >= m_capacity)
	{
		res.found = false;
		res.result.value = storage_system::Result::SLOT_OUT_OF_BOUNDS;
		res.result.message = "Requested slot out of bounds";
		return true;
	}

	if(!m_slots[slot].occupied)
	{
		res.found = false;
		res.result.value = storage_system::Result::SLOT_EMPTY;
		res.result.message = "Requested slot is empty";
		return true;
	}

	res.state = m_slots[slot].state;
	res.found = true;
	res.result.value = storage_system::Result::NONE;
	return true;
}

bool SlotStorageSystem::getNextSPLClbk(GetNextSPL::Request &req, GetNextSPL::Response &res)
{
	for(size_t k = 0; k < m_slots.size(); ++k)
	{
		size_t i = m_ascending_order ? k : (m_slots.size() - 1 - k);
		if(m_slots[i].occupied && m_slots[i].state == req.state)
		{
			res.slot = static_cast<int32_t>(i);
			res.spl.id = m_slots[i].id;
			res.spl.state = m_slots[i].state;
			res.found = true;
			res.result.value = storage_system::Result::NONE;
			return true;
		}
	}

	ROS_WARN_STREAM("[" << m_storage_id << "] GetNextSPL: no occupied slot with state '" << req.state << "'");
	res.found = false;
	res.result.value = storage_system::Result::ITEM_NOT_FOUND;
	res.result.message = "No SPL found with the requested state";
	return true;
}

};
