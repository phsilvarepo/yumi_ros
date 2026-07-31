# ROS2_MSGS

ROS2 (ament_cmake / rosidl) message- and service-only mirrors of select ROS1
packages from this repo, for use by ROS2 nodes that need to communicate with
the ROS1 `ros_vnc` container's nodes across a ROS1↔ROS2 bridge (e.g.
`ros1_bridge`).

Each package here:
- Has the **same package name** and **same `.msg`/`.srv` file names/fields**
  as its ROS1 counterpart — this is required for `ros1_bridge` (and any
  hand-written bridging) to map types across the boundary.
- Contains **no executable code** — interface definitions only.
- Is **not** part of the ROS1 catkin workspace; it's a separate ROS2
  (colcon) workspace/package tree, built independently on the ROS2 side.

## Packages

- **`moveit_commander/`** — mirrors the `.srv` files from
  `ros_modules/moveit_commander` (ROS1): `ExecuteSequence`,
  `AddObjectToScene`, `RemoveObjectFromScene`, `AttachObject`,
  `DetachObject`, `SetPathConstraints`, `ClearPathConstraints`,
  `SwitchGroup`. Depends only on `geometry_msgs` (for `AddObjectToScene`'s
  `geometry_msgs/Pose` field) — no MoveIt dependency.
- **`storage_system/`** — mirrors the `.msg`/`.srv` files from
  `yumi_ros/storage_system` (ROS1): messages `SPL`, `Result`; services
  `GetSlot`, `SetSPL`, `GetSPL`, `RemoveSPL`, `UpdateSPLState`,
  `GetSPLState`, `GetNextSPL`. No dependencies beyond `rosidl_default_generators`.

## Keeping in sync

If a `.msg`/`.srv` file changes on the ROS1 side, the matching file here
must be updated to match exactly (field names, types, and order), or the
ROS1↔ROS2 bridge will fail to map the type. Each file here has a comment
pointing back at its ROS1 source of truth.

## Building (ROS2 side)

These are plain ROS2 packages — drop (or symlink) this `ROS2_MSGS/` folder's
subpackages into a ROS2 workspace's `src/` and build with `colcon build`,
e.g.:

```bash
colcon build --packages-select moveit_commander storage_system
```
