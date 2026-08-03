# moveit_poses — Design

## 0. Naming / revision note (2026-08-03)
Package renamed from `spl_pose_deriver` to `moveit_poses`. More importantly,
**Decision #1 below was reversed** after review: the user correctly pointed
out the original "no TF lookups" design couldn't actually resolve poses into
a planning group's root frame, since the service request didn't carry any
notion of target/root frame at all. This node now:
- owns a `tf2_ros::Buffer` + `tf2_ros::TransformListener`,
- accepts `group_name` / `target_frame` in the request,
- performs `lookupTransform` + `tf2::doTransform` to return poses already
  expressed in the resolved root frame (not just in the slot's own local
  frame as before).
See revised Decision #1 in Section 4.

## 1. Problem
The RobotController (left/right) needs to derive the APPROACH and ENGAGE
end-effector poses for a given slot, given only a `(storage_id, slot)` pair
(the same addressing scheme as `storage_system`), with different
end-effector attitudes depending on whether the slot is a EuroContainer slot
or a Redboard slot. Gripper storage has no APPROACH/ENGAGE motion of its own
(the SPL is directly attached to the gripper link while there) and is out of
scope.

## 2. Prior art inspected: `yumi_ros/nodered/yumi_nodered_spl_tester.json`
The Node-RED flow already did something similar, but working from Isaac
Sim's flat `isaac_sim/object_poses` topic (no TF), so it had to do everything
manually:
- Look up a base object pose by string name (`"station/" + side + "arm/position/eurocontainer0" + slots[0]`
  for EC, `side + "arm/position/redboard_0" + slot` for Redboard).
- For EC, apply a further per-SPL-sub-slot offset computed from `slot % 5` /
  `floor(slot / 5) % 2` (row/col within a sub-grid) — because the Isaac Sim
  ground truth only exposed one pose per physical container, not per SPL.
- Apply a fixed ENGAGE offset (position + orientation) and a separate fixed
  APPROACH offset (position + orientation) via a `sumPositionOffset(base,
  offset)` helper — note this helper only **sums position**, orientation is
  always taken from the offset itself (never summed), i.e. APPROACH/ENGAGE
  orientations are absolute attitudes, not deltas from the slot's own
  orientation.

Values recovered (kept here for traceability / as calibration reference —
NOT used verbatim, see Decision #2):
```
offset_eurocontainer_slot: pos (-0.0428, -0.04, 0.12/2+0.05) ori (0, -180, 0)
offset_eurocontainer_spl_slot: pos (2*0.0428, 0.02, 0) ori (0, -180, 0)   # sub-grid step
container_approach:  pos (0, 0, 0.05)  ori (0, -180, 0)   # same ori as engage
offset_redboard:     pos (0.005, 0.00, 0.05) ori (90, 0, 180)
redboard_approach:   pos (0, 0, 0.05) ori (-90, 0, 0)     # DIFFERENT ori from engage
```

## 3. Key discovery: TF already gives us per-slot frames — no manual math needed
Unlike the Isaac Sim topic Node-RED had to work from, the real station's
xacro (`spl_electricalstation_description`) already publishes a **static TF
frame for every individual slot**:
- EuroContainer: `eurocontainer_<side>_spl_slot_g<gx><gy>_r<row>_c<col>`
  — 4 quadrants (`gx,gy` in {0,1}) x 2 cols x 5 rows = 40 slots/side
  (`spl_eurocontainer.xacro`).
- Redboard: `redboard_slot_<side>_<row>_<col>` — 2 rows x 4 cols = 8
  slots/side (`spl_electricalstation_slots.xacro`).

This means `moveit_poses` only needs to do **pure indexing** (flat slot
index -> frame name, no coordinate math) plus apply a **fixed, configurable
offset** from that frame — then a TF lookup/transform resolves that local
pose into whatever root frame the caller asked for. See Decision #1.

## 4. Decisions

1. **[REVISED 2026-08-03] TF lookups/transforms ARE performed by this
   node.** Original design (below, kept for traceability) had
   `GetApproachEngagePoses` return `PoseStamped` with `header.frame_id` set
   to the slot's own static TF frame name, leaving the caller
   (MoveitCommander/MoveGroup) to resolve the transform itself. This was
   **wrong**: the service request carried no notion of a target/root frame
   at all, so there was no way to express "give me this pose in the
   planning group's root frame" — the caller would've had to already know
   the slot's frame name and do its own TF work, defeating the purpose of a
   dedicated pose-deriving service. Corrected design: the request now
   carries `group_name` and `target_frame` (see Section 5); this node owns
   a `tf2_ros::Buffer`/`tf2_ros::TransformListener`, resolves the local
   slot-frame pose (position + absolute orientation, mirroring Node-RED's
   "orientation is never summed, only overridden" behavior — this part of
   the original reasoning still holds), then performs
   `lookupTransform`/`tf2::doTransform` into the resolved root frame before
   returning. If `target_frame` is non-empty it wins outright; else
   `group_name` is resolved via the `~group_root_frames` param map; else
   `~default_root_frame` (default `"world"`) is used. This still keeps the
   node's own *offset* logic pure/config-driven — only the final resolution
   step now genuinely touches TF, which is unavoidable if the output must be
   expressed in a caller-chosen frame.
2. **Offsets are configurable ROS params, not hardcoded Node-RED values.**
   The Node-RED numbers in Section 2 are kept only as a starting reference
   point; real values need on-robot calibration (see Open Items). The
   `redboard_approach` orientation (roll -90) differing from
   `offset_redboard`'s engage orientation (roll +90) looked deliberate in
   the reference (a different wrist attitude for the retreat than for the
   grasp), not a copy/paste bug — but this needs confirming against the
   real robot, not assumed.
3. **One node covers both kinds/sides** (unlike `storage_system`, which
   launches one node instance per storage_id because each instance holds
   real inventory state). `moveit_poses` is a stateless computation
   service — `storage_id` is a request-time string, not a per-instance
   launch param — so a single node instance is sufficient.
4. **Gripper storage is out of scope.** An SPL "in gripper" has no
   APPROACH/ENGAGE motion of its own to derive.
5. **Flat slot index -> frame name mapping is this package's own
   convention**, chosen to exactly mirror the xacro's existing structure
   (documented in the header comments of `PoseDeriver.h`/`.cpp`):
   - EuroContainer: `quadrant = slot / 10; gx = quadrant / 2; gy = quadrant % 2;
     sub = slot % 10; row = sub / 2; col = sub % 2`.
   - Redboard: `row = slot / 4; col = slot % 4`.
   This must stay in sync with `storage_system`'s own flat 0-39/0-7 ordering
   (both just use ascending integer slot indices — no reordering needed,
   since `storage_system` doesn't know or care what a slot index "means"
   geometrically, only `moveit_poses` does).
6. **`group_name` -> root frame mapping is a config param
   (`~group_root_frames`), not hardcoded.** MoveIt SRDF group names (e.g.
   `left_arm`) aren't necessarily TF frame names themselves, so a map is
   needed. Placeholder default maps both `left_arm`/`right_arm` to
   `yumi_base_link` (the real URDF base link name, confirmed in
   `yumi_description/urdf/yumi.xacro`) — the actual SRDF group names need
   confirming once the MoveIt config for this station exists (see Open
   Items).

## 5. Service surface
`GetApproachEngagePoses.srv`:
```
string storage_id   # "eurocontainer_left" | "eurocontainer_right" | "redboard_left" | "redboard_right"
int32 slot
string group_name    # optional; resolved to a root frame via ~group_root_frames
string target_frame  # optional; wins outright over group_name if non-empty
---
geometry_msgs/PoseStamped approach_pose   # expressed in the resolved root frame
geometry_msgs/PoseStamped engage_pose     # expressed in the resolved root frame
bool success
string message
```

## 6. Open Items (NOT blocking implementation, but blocking real use)
1. **Calibration.** All default offset values in `config/moveit_poses.yaml`
   are placeholders carried over/adapted from the Node-RED reference — they
   have NOT been validated against the real (or even simulated) station
   geometry with the new TF-anchored approach. Must be tuned on-robot (or in
   Isaac Sim against the new xacro frames) before use in an actual pick/place
   sequence.
2. **Redboard mesh sub-frames currently only instantiated for the left
   side** (`spl_electricalstation.xacro` only calls `spl_redboard` for
   `redboard_slot_left_*`, not `redboard_slot_right_*`) — irrelevant to this
   package (we anchor on the outer `redboard_slot_<side>_<row>_<col>` frame,
   which exists both sides), but worth flagging since it means the right
   Redboard side currently has no visual/collision mesh at all in the
   xacro — a gap in `spl_electricalstation_description`, not here.
3. **APPROACH defined as an independent full offset (matching Node-RED),
   not "ENGAGE + delta".** Current config sets both to a straight vertical
   offset from the slot frame (a small lift for ENGAGE, a larger lift for
   APPROACH) — this is a placeholder shape, not a validated one. Real
   APPROACH paths may need lateral (x/y) components too, depending on the
   gripper's actual reach envelope in each kind's local frame.
4. **`~group_root_frames` placeholder mapping is not yet validated against
   a real MoveIt SRDF** for this station — `left_arm`/`right_arm` group
   names and the `yumi_base_link` target are best-guesses pending the
   actual MoveIt config.

## 7. Not yet done
- Not integrated into the Supervisor BT / RobotController yet — this is a
  standalone service, to be called from wherever `MOVE ... APPROACH` /
  `MOVE ... ENGAGE` leaves are implemented (see
  `storage_system/SPECS/20260731_StorageSystem_Spec_and_Roadmap.md`,
  Section 9.2/9.5).
- TF lookup/transform tested against a live `robot_state_publisher`
  publishing the actual xacro TF tree in the `ros_vnc` container (see
  Section 8 below for what WAS tested).

## 8. Original design (kept for traceability — superseded by Decision #1 above)
The original Section 4 Decision #1 read:

> No TF lookups/transforms inside this node. `GetApproachEngagePoses`
> returns `PoseStamped` with `header.frame_id` set to the slot's own static
> TF frame name, and `pose` set to the configured offset... The caller
> (MoveitCommander/MoveGroup) resolves the actual transform via TF...

This was implemented and successfully tested (frame-name computation only,
verified via `rosservice call` for EC slots 0/10/39 and Redboard slots 0/7,
plus the `Slot out of bounds`/`Unknown storage_id` error paths) before the
gap was identified and this doc + the code were revised.
