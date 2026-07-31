# SPL — the item type tracked by StorageSystem.
#
# id: unique identifier for the SPL (e.g. from QR/barcode scan, or assigned on
#     population). -1 means "unassigned/unknown".
# state: opaque lifecycle state string, e.g. "NEW", "IN_PROCESS", "DONE".
#     StorageSystem does not interpret/branch on this value, it only stores
#     and reports it. Kept as a free-form string for now.
#
# Mirror of yumi_ros/storage_system/msg/SPL.msg (ROS1) — keep in sync.

int32 id
string state
