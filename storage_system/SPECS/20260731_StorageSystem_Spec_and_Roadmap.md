# StorageSystem — Specification & Roadmap

**Status:** Draft spec, ready for implementation. Supersedes/replaces
`20260730_StorageSystem_Design_Draft.md` (yesterday's over-scoped brainstorm — discard reservation/
registry/capability services proposed there; not needed, see Decisions Log below).

**Date:** 2026-07-31 (updated same day with TF-ownership / orchestration decisions — see
Sections 8 and 9)

**Source of truth for requirements:** `yumi_ros/storage_system/SPECS/directives.md`

**Reference implementation studied:** `atlas_incm/storage_system` (GitLab), branch `devel`,
cloned locally to `yumi_ros/storage_system/repo_ref/` for inspection (not to be committed —
reference only).

---

## 1. Requirements (from directives.md)

> ROS node that tracks the EuroContainers and the SPLs coming to the station on the EC slots (40)
> and when they are picked up by the robot to and from the redboards, and when they lie in it
> while being processed.
>
> The SPLs have ID and state.
>
> The StorageSystems should be individual, and different/mirrored for each workspace (left to
> right):
> - Eurocontainers (1 slot for each arm, 40 SPL slots per container)
> - Grippers (1 SPL slot)
> - Redboards (8 slots per arm, 1 SPL slot per Redboard)
>
> Following the logic of `atlas_incm/storage_system`, specifically `devel` branch and the services
> there.

## 2. Reference pattern (from `atlas_incm/storage_system@devel`)

- **One class + one node per storage type** (e.g. `IntrayStorageSystem`, `BoxStorageSystem`,
  `MinitrayStorageSystem`), each holding a fixed-size `std::vector<Item*>` where `nullptr` means
  an empty slot.
- **Mirrored/instantiated per workspace** via a launch file `name` arg + ROS namespace
  (`ns="/atlas/$(arg name)/cognition/"`) and `rosparam`-driven config (`device`, `capacity`,
  `slot_frame_prefix`, `valid_states`, `report_states`, `empty`) — i.e. the *same compiled node*,
  launched twice with different params/namespace, one per side. This is exactly the "individual,
  mirrored per workspace" model directed.
- **Items carry ID + State** (`Intray`/`IntrayState`, `Box`/`BoxState`, etc.), matching "SPLs have
  ID and state."
- **TF publishing** per slot via `slot_frame_prefix` + slot index (`tf::TransformBroadcaster`) —
  reference publishes marker/content frames (e.g. minitray/subbatch/box markers *within* a slot),
  NOT re-parented "follow the picked item" frames. Confirmed via grep: **no** reference to
  `planning_scene`/`PlanningScene`/`attachObject`/`collision_object` anywhere in the reference
  codebase — the reference never touches MoveIt at all. See Section 8 for why we are dropping
  Storage-side TF publishing entirely for our system (a stronger simplification than even the
  reference does).
- **Service surface actually implemented** (all from a separate `atlas_srvs` package, not
  redefined per storage type):
  - `GetSlot` — find a free slot index.
  - `Set<Item>` (e.g. `SetIntray`, `SetBox`) — place an item into a specific slot index.
  - `Get<Item>` (e.g. `GetIntray`, `GetBox`) — retrieve/remove an item from a slot.
  - `UpdateState` — update an item's state (searched by ID).
  - `GetState` — query an item's/storage's state.
  - `ReportCompletion` (client call out) — notify a supervisor when an item reaches a
    "reportable" state.
  - `RequestItem` (client call out) — request a refill when a slot/queue runs low/empty.
  - `std_srvs/Trigger` used for simple refill-style calls in some nodes.
- **No reservation/locking mechanism exists** in the reference for concurrent claims on slots.
  The closest related concept, `locked_slots` (seen in `MinitrayStorageSystem`), is a **static
  startup-time param** that permanently disables specific slot indices (fills them with a dummy
  placeholder item) — not a runtime reserve/release mechanism. This was investigated explicitly
  (grep across `include/`, `src/`) and confirmed absent.

## 3. Decisions Log (resolved during discussion)

1. **No cross-arm slot contention exists.** Per directive, Eurocontainers/Redboards/Grippers are
   individually instantiated per arm (left/right each have their own dedicated pool) — there is
   NO shared slot pool between arms. This eliminates the need for any reserve/claim/lock
   mechanism to prevent inter-arm race conditions, since no such race exists by construction.
   (Yesterday's draft wrongly assumed a shared pool and proposed `ReserveSlot`/`ReleaseSlot`
   services for that reason — this is now explicitly ruled out as unnecessary for that reason.)
2. **Reservation/locking is not entirely dismissed as a concept** — it simply isn't implemented in
   the reference repo and isn't needed for the cross-arm case. It remains an open idea to
   potentially revisit later for other purposes (e.g. a single arm double-checking a slot before
   a multi-step pick sequence), but is explicitly OUT of the initial implementation scope. Track
   as a future extension point, not a requirement now.
3. **Follow the reference service surface literally** — `GetSlot`, `Set<Item>`, `Get<Item>`,
   `UpdateState`, `GetState` — adapted to our own item type (`SPL`) and our own storage types
   (`Eurocontainer`, `Redboard`, `Gripper`), rather than inventing new registry/capability/content
   services as drafted yesterday.
4. **Geometry (TF):** existing xacro-defined slot frames already exist for the EuroContainer's 40
   slots (`spl_eurocontainer.xacro`) and should be reused as this system's per-slot TF frames
   (mirroring `slot_frame_prefix` + index broadcasting from the reference), rather than
   re-deriving pose math. Redboard/Gripper slot frame naming needs to be (re-)confirmed against
   `spl_redboard.xacro` / gripper xacro before implementation (see Open Items).
5. **No unnecessary templatization / per-item-type class duplication — but keep this trial run
   extensible to other item types later.** The reference repo duplicates near-identical classes
   per item type (`IntrayStorageSystem`, `BoxStorageSystem`, `MinitrayStorageSystem`, ...), each
   hand-copied with the same `GetSlot`/`Set<Item>`/`Get<Item>` shape and TF-broadcast loop. This
   is real duplication debt, not a pattern to mirror. For **this trial run** we only implement
   `SPL` as the moving item type (id + state) across three storage kinds that differ only in
   capacity/naming — one shared `SlotStorageSystem` class, parametrized by construction-time data
   (capacity, slot naming, ROS namespace), not C++ templates, not subclassing. One binary,
   launched 6 times (Eurocontainer/Redboard/Gripper × left/right).
   **However:** per user, this may later extend to storing *other* things as items in their own
   right — e.g. treating an EuroContainer itself, or a Redboard itself, as a storable "item" in
   some higher-level storage (a station-level "what EC/Redboards are currently present" registry)
   — not just SPLs moving between them. The class/package should be designed so that the *item
   type* (`SPL` now) is a clearly isolated/swappable concern (own header, own `.srv` message
   fields), so that adding a second item type (e.g. `EC` or `Redboard` as items) later doesn't
   require restructuring `SlotStorageSystem` itself — only adding a new item type + a new set of
   `.srv` files following the same shape. Not building this now, just keeping the seam clean.
6. **`StorageSystem` does not publish any TF at all.** Initially assumed (mirroring the
   reference's per-slot marker broadcasting) that Storage should publish frames like
   `eurocontainer_left_spl_slot_g00_r3_c1 → SPL_1234`. Rejected after working through the
   grasp/place handoff in detail — see Section 8 for the full reasoning. Summary: while an SPL
   sits in a slot its pose is identical to that slot's pose, and the slot's static TF frame
   already exists (published by `robot_state_publisher` from the xacro) independent of occupancy.
   Once picked, the item's live pose is owned exclusively by MoveIt's attached collision object.
   There is no lifecycle state in which Storage needs to be a TF publisher — "where is SPL 1234"
   always decomposes into (a) an inventory/identity lookup against `StorageSystem` (which slot,
   or "attached to gripper") plus (b) a geometry lookup against something that already publishes
   that geometry (static URDF frame, or MoveIt attached-object pose) — never both from the same
   source, never duplicated.
7. **`StorageSystem` never talks to MoveIt / the planning scene, in either direction.** No
   `AddObjectToScene`/`AttachObject`/`DetachObject`/`RemoveObjectFromScene` calls originate from
   Storage, and Storage is never queried by MoveIt. This mirrors the reference (which also never
   touches planning-scene APIs) but goes further philosophically: Storage is a **pure
   inventory/data service** (slot ↔ SPL id/state bookkeeping only). Planning-scene collision
   awareness and the physical grasp/release sequence belong entirely to the Supervisor BT /
   Robot Controller / `MoveitCommander`, which orchestrate calls to *both* Storage and MoveIt in
   the correct sequence — see Section 9 for the concrete orchestration contract.
8. **`GetSPL` is peek-only; `RemoveSPL` is a separate explicit call.** Resolved: retrieving an
   SPL's id/state/contents (`GetSPL`) does NOT clear the slot, unlike the reference's
   `getIntrayClbk`/`getNextBoxClbk` which conflate fetch-and-clear. A separate `RemoveSPL`
   explicitly empties a slot. Chosen because our BT already explicitly sequences distinct steps
   (`Attach` then "clear source slot" as its own step, see Section 9.2) — conflating peek/pop
   into one call would fight that explicit sequencing model.
9. **Error/result type:** based on user-provided `atlas_msgs/ErrorId` enum shape (kept as
   inspiration, reproduced locally — NOT an `atlas_msgs` dependency, since user flagged the
   reference package "may have many mistakes and inconsistencies"). Every service response
   carries a `Result`-shaped `{uint32 value, string message}` pair (name TBD: reused inline per
   service, or a shared `Result.msg` — leaning shared message for consistency). Reused the
   reference's `STORAGE_FULL = 1000` / `ITEM_NOT_FOUND = 1001` values for familiarity, and added
   new codes needed for our own bounds/state checks not present in the reference's snippet
   (`SLOT_OUT_OF_BOUNDS`, `SLOT_OCCUPIED`, `SLOT_EMPTY`, `INVALID_STATE` — see Section 4.3 for the
   full list). This is NOT a blocking decision in practice — can add codes freely later without
   breaking callers, as long as existing ones aren't renumbered.
10. **`GetNextSPL` service added (2026-07-31)** to close a real gap found while walking through
    "how does the Supervisor BT actually start the pick loop": no existing service could answer
    "which occupied slot should I act on next" (see Section 9.4 for the full walkthrough).
    Resolved as: `GetNextSPL(state)` — given a target SPL state (e.g. "READY"), Storage returns
    the first occupied slot whose SPL matches that state, scanned in a **statically configured**
    ascending/descending slot-index order — confirmed against the reference repo's
    `IntrayStorageSystem`, which has exactly this pattern: a boolean param
    `get_minitray_order` (`true: 0->15 slots, false: 15->0 slots`) controlling traversal direction
    for `getFreeSlot`/`getMinitray`. We mirror this exactly rather than inventing a full
    `~slot_priority` list (an earlier, over-engineered idea floated before finding the reference's
    actual pattern): a single boolean param `~ascending_order` (default `true`), used consistently
    by both `GetSlot` (free-slot search) and `GetNextSPL` (occupied-slot search). This keeps
    "closest to the robot" as static, launch-time configuration — no live TF/geometry query,
    consistent with Decisions Log #6/#7.

## 4. Target design

### 4.1 Item type: `SPL`
- Fields: `id` (int), `state` (enum, TBD — see Open Items).
- Mirrors `Intray`/`IntrayState` pattern: a small class wrapping ID + state with `toString()`/
  `toROSMsg()`-style helpers, likely backed by a shared `atlas_libs`-style message
  (`SPLState`/`SPL.msg`) — needs a local equivalent since `yumi_ros` doesn't depend on
  `atlas_libs`/`atlas_msgs`/`atlas_srvs`.

### 4.2 Storage types (one class + one node each, mirroring `IntrayStorageSystem` shape)

| Class | Capacity | Mirrored per arm? | Notes |
|---|---|---|---|
| `EurocontainerStorageSystem` | 40 SPL slots | Yes (left/right) | Reuses existing `eurocontainer_${name}_spl_slot_g${gx}${gy}_r${row}_c${col}` TF frames from `spl_eurocontainer.xacro` |
| `RedboardStorageSystem` | 8 Redboard slots, 1 SPL slot each | Yes (left/right) | Redboard slot TF frame naming TBD — needs re-check against `spl_redboard.xacro` |
| `GripperStorageSystem` | 1 SPL slot | Yes (left/right) | Simplest case — single-slot storage, capacity 1 |

Each gets its own launch file following the `name` arg + namespace pattern, e.g.:
```
storage_system_eurocontainer.launch   (arg: name=left_arm|right_arm)
storage_system_redboard.launch        (arg: name=left_arm|right_arm)
storage_system_gripper.launch         (arg: name=left_arm|right_arm)
```

### 4.3 Services (own `.srv` files, since `atlas_srvs` is not a `yumi_ros` dependency)

Per storage type, mirroring the reference 1:1 (naming adapted to SPL/our nouns), **with the
peek/pop split resolved** (see Decisions Log #8): `GetSPL` is search-and-retrieve/peek only
(does not empty the slot); a separate `RemoveSPL` explicitly empties a slot.

- `GetSlot.srv` — request a free slot index (shared shape across storage types, reusable).
- `SetSPL.srv` — place an SPL (with ID/state) into a given slot index.
- `GetSPL.srv` — **peek** — search/retrieve an SPL's id/state and/or a slot's contents, without
  modifying storage state. Supports lookup by slot index or by SPL id (search).
- `RemoveSPL.srv` — **pop** — explicitly empties a slot (used by the BT after `Attach`, per
  Section 9.2), separate from `GetSPL` so retrieval and removal are independent, explicit BT
  steps (matches how the BT already sequences Attach and "clear source slot" as distinct steps).
- `UpdateSPLState.srv` — update state of an SPL by ID.
- `GetSPLState.srv` — query state of an SPL by ID or by slot.

Result/error type for ALL service responses (see Decisions Log #7), based on the user-provided
`atlas_msgs/ErrorId` enum shape, reproduced locally (no `atlas_msgs` dependency):

```
# Result.msg (or inlined per-service as `uint32 error_code` + `string message` fields)
uint32 NONE = 0

## STORAGE SYSTEM ERRORS (reusing the reference's numeric range, 1000+, for compatibility/
## familiarity, even though we don't depend on atlas_msgs itself)
uint32 STORAGE_FULL       = 1000
uint32 ITEM_NOT_FOUND     = 1001
uint32 SLOT_OUT_OF_BOUNDS = 1002   # new — not in reference's snippet, needed for our bounds checks
uint32 SLOT_OCCUPIED      = 1003   # new — set requested on a non-empty slot
uint32 SLOT_EMPTY         = 1004   # new — get/remove requested on an empty slot
uint32 INVALID_STATE      = 1005   # new — requested SPL state not in configured valid-states list

uint32 value
string message
```
Every `.srv` response includes `Result result` (or inline `uint32 error_code` + `string message`)
following this shape, plus whatever payload fields the specific service needs (e.g. `int32[]
slots`, `SPL spl`, `bool success`).

## 5. Open Items

**Genuinely blocking (touch `.srv` shape/semantics — resolved below, kept for traceability):**

- ~~Item 7 (error/result type)~~ — **RESOLVED**, see Decisions Log #9.
- ~~Item 8 (peek vs. pop for `GetSPL`)~~ — **RESOLVED**, see Decisions Log #8.

**Not actually blocking — parametrized/config concerns, changeable after code is implemented and
tested without touching the `.srv` API or class structure (correctly called out by user as
over-flagged in the first pass of this doc):**

1. **SPL state enum values** — not blocking. Storage treats state as opaque data (mirroring the
   reference's `IntrayState`, which is only ever compared against a configured valid-states
   list, never branched on internally). Will implement as a `string` field with a placeholder
   set (`NEW`, `IN_PROCESS`, `DONE`) and refine values later — pure data, no code-shape impact.
2. **Redboard/Gripper slot TF frame naming** — not blocking, and arguably not even Storage's
   concern at all per Decisions Log #6/#7 (Storage never touches TF). Only relevant to whoever
   later calls `AddObjectToScene` (Supervisor/MoveitCommander) — separate package, separate task.
3. **Namespace/launch convention** — a launch-file string param, trivially changed later.
4. **Package layout** — effectively already decided (Decision #5, one shared class/node,
   config-driven) — not actually open.
5. **Reserve/claim mechanism** — explicitly deferred (Decisions Log #1/#2), not needed now.

## 6. Roadmap / Task breakdown

1. [ ] Define `SPL` item type (id + state) — local to `yumi_ros`, no `atlas_libs`/`atlas_msgs`
   dependency.
2. [ ] Define `.srv` files: `GetSlot.srv`, `SetSPL.srv`, `GetSPL.srv`, `RemoveSPL.srv`,
   `UpdateSPLState.srv`, `GetSPLState.srv` — with the `Result` error/message shape from
   Decisions Log #9 (no `atlas_msgs` dependency).
3. [ ] Scaffold a single shared `SlotStorageSystem` class + node (no per-storage-kind
   subclassing/templating — see Decision #5), configured entirely via ROS params at launch
   (capacity, slot naming, namespace).
4. [ ] Write launch files instantiating this one node 6 times: Eurocontainer × {left, right}
   (capacity 40), Redboard × {left, right} (capacity 8), Gripper × {left, right} (capacity 1).
5. [ ] Confirm and document the Supervisor-orchestrated call sequences (Section 9) as the
   integration contract other packages (Supervisor BT, Robot Controllers, `moveit_commander`)
   must follow — Storage itself does not enforce this sequencing, it only exposes the primitives.
6. [ ] Integrate with Node-RED (`yumi_nodered_spl_tester.json`) as an interim test harness —
   replace/augment the existing inline slot-offset-math function (~line 7177) to call the new
   `GetSlot`/`SetSPL`/`GetSPL` services instead of manual string-matching against
   `isaac_sim/object_poses`. NOTE: per user, production logic is migrating from Node-RED into
   Behaviour Trees (Supervisor + Left/Right Robot Controllers, see Section 9) — Node-RED
   integration here is a stepping-stone/test harness, not the final consumer.
7. [ ] Validate in `ros_vnc` container (build, launch, manual service calls via `rosservice call`)
   before wiring into the full pick-and-place BT flow.

## 7. Explicitly NOT decided / NOT started

- No `.srv` files created yet.
- No package/CMakeLists/package.xml created yet.
- No C++ classes/nodes written yet.
- No launch files created yet.
- No Node-RED changes made yet.
- No Behaviour Tree changes made yet.
- `repo_ref/` (cloned reference repo) is a local-only reference clone, not intended to be
  committed to `yumi_ros` — added to `yumi_ros/.gitignore` (`storage_system/repo_ref/`) on
  2026-07-31.

## 8. TF ownership — why `StorageSystem` publishes no TF at all

This was worked through step by step during design discussion; keeping the reasoning (including
the intermediate wrong answers) for context, since the final rule is easy to get wrong again:

1. **First instinct (wrong):** Storage should publish item-following frames like
   `eurocontainer_left_spl_slot_g00_r3_c1 → SPL_1234`, mirroring the reference's per-slot content
   markers. Problem: if MoveIt's `Attach Object` re-parents `SPL_1234` onto the gripper link at
   grasp time while Storage is still publishing `slot → SPL_1234`, two systems fight over the same
   child frame — a real conflict.
2. **Second instinct (also wrong):** since the Supervisor BT explicitly sequences
   `Attach → Remove(source)` and `Detach → Set(destination)`, there's never actually a moment of
   *concurrent* ownership — the BT hands off the baton cleanly. This resolves the race, but doesn't
   answer why Storage would need to publish TF in the first place.
3. **Final answer:** it doesn't need to, ever. While an SPL sits in a slot, its pose is **identical
   to that slot's own pose** — and the slot's frame is already published, statically, by
   `robot_state_publisher` from the xacro (`spl_eurocontainer.xacro` et al.), independent of
   whether the slot is occupied. An `SPL_1234`-named frame would carry zero geometric information
   beyond what the static slot frame already provides — the only new information is *identity*
   ("which item is here"), which is a data/inventory fact, not a geometry fact. Once picked, the
   item's live pose is owned exclusively by MoveIt's attached collision object — again, nothing
   for Storage to publish.
4. **Resulting rule:** "where is SPL 1234 right now" always decomposes into two independent
   lookups that never overlap in source:
   - **Identity/inventory** (Storage): which slot holds SPL 1234, or "currently attached to
     gripper" (state, not geometry).
   - **Geometry** (never Storage): the slot's existing static xacro TF frame, OR (if attached)
     MoveIt's live attached-object pose.
   `StorageSystem` therefore has **zero TF publishers**. This also removes an entire class of
   synchronization bugs (stale/duplicate frames, publish-rate mismatches, re-parenting races)
   before they can exist.

## 9. Orchestration model — who calls Storage and MoveIt, and when

Per the existing architecture diagram (Dashboard → Supervisor → Robot Left/Right Controller →
`MoveitCommander`; separate disconnected `STATION STORAGE` box only reachable via Supervisor), and
per Decision #7 (Storage never talks to MoveIt, and vice versa): the **Supervisor BT is the sole
orchestrator** that calls both services, in sequence, at each lifecycle step. Storage and MoveIt
never call each other directly, and are not otherwise coupled — they only end up eventually
consistent because the Supervisor issues both calls back-to-back.

### 9.1 EuroContainer arrival (population)
Operator informs Dashboard a new EC (with up to 40 SPLs) has been placed. Dashboard relays to
Supervisor. Supervisor then, per slot/SPL:
```
Supervisor:
  for each SPL i discovered in the EC (0..39, or fewer if partially full):
    StorageSystem(eurocontainer_<side>).SetSPL(slot=i, spl_id=..., state=NEW)   # inventory only
    MoveitCommander.AddObjectToScene(frame=<slot i's existing static TF frame>,
                                      mesh=SPL, id=spl_id)                      # collision awareness
```
(SPL IDs may come from the Dashboard directly, or be discovered per-slot later via `CAM_QR_L`/
`CAM_QR_R` — TBD, does not change the call shape, only *when* `SetSPL`'s `spl_id` becomes known.)

### 9.2 Pick SPL from EC, place on Redboard (per the diagram's numbered sequence "1")
```
Supervisor / Robot Controller BT leaf sequence:
  MOVE EC Slot APPROACH
  MOVE EC Slot ENGAGE
  GRASP (MoveitCommander.AttachObject spl_id to gripper link)
  StorageSystem(eurocontainer_<side>).RemoveSPL / clear slot i        # <- source storage cleared
  MOVE EC Slot APPROACH (retreat)
  MOVE RB Slot APPROACH
  MOVE RB Slot ENGAGE
  RELEASE (MoveitCommander.DetachObject spl_id)
  StorageSystem(redboard_<side>).SetSPL(slot=j, spl_id=..., state=...)  # <- destination storage set
  MOVE RB Slot APPROACH (retreat)
```
The exact `Attach/Remove` and `Detach/Set` pairing (which happens first) is an implementation
detail for the BT to fix consistently — the important invariant is that at any instant, **at most
one** of {source Storage slot, destination Storage slot, MoveIt attached-object} claims to "have"
that SPL; Storage's own state (never TF) reflects this.

### 9.3 Consequence for `StorageSystem`'s service surface
Because Storage is purely reactive to Supervisor calls (never initiates anything, never watches
MoveIt state, never publishes TF), its `.srv` surface stays exactly as scoped in Section 4.3:
`GetSlot`, `SetSPL`, `GetSPL` (peek — search/retrieve an SPL's id/state, or a slot's contents,
without modifying anything), `RemoveSPL` (a separate, explicit call that just empties a slot),
`UpdateSPLState`, `GetSPLState`, and `GetNextSPL` (added 2026-07-31, see Decisions Log #10 below —
the actual pick-loop entry point). No further new services are needed to support this
orchestration model — the Supervisor composes these existing primitives, e.g. in Section 9.2's
pick sequence: `Attach` (MoveitCommander) is followed by an explicit `RemoveSPL` call (Storage) to
clear the source slot — never a combined fetch-and-clear call, per Decisions Log #8.

### 9.4 Gap found & closed: the pick-loop entry point (`GetNextSPL`)
Working through "how does the BT even start the pick loop" surfaced a real gap: none of the
existing services let the Supervisor ask "which slot should I pick from next?" — `GetSlot` finds a
*free* slot (for placing), `GetSPL`/`GetSPLState` require already knowing a slot index or id. There
was no way to enumerate/select an occupied slot to act on.

Resolved as `GetNextSPL` (Decisions Log #10): given a target `state` (e.g. "READY"), Storage
returns the first matching occupied slot, iterated in a **statically configured** ascending/
descending order (see Decision #10) — not a live geometric/TF query (would violate Decisions Log
#6/#7). Since slot layout is fixed at design time (xacro), "closest to the robot" reduces to a
fixed index traversal direction, known and configurable at launch, no live geometry needed.
