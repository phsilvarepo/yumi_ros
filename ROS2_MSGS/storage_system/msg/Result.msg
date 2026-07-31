# Result — error/status shape for all storage_system service responses.
#
# Mirror of yumi_ros/storage_system/msg/Result.msg (ROS1) — keep in sync.

uint32 NONE = 0

## STORAGE SYSTEM ERRORS
uint32 STORAGE_FULL       = 1000  # no free slot available (GetSlot)
uint32 ITEM_NOT_FOUND     = 1001  # requested SPL id/state not found in this storage
uint32 SLOT_OUT_OF_BOUNDS = 1002  # requested slot index >= capacity
uint32 SLOT_OCCUPIED      = 1003  # SetSPL requested on a non-empty slot
uint32 SLOT_EMPTY         = 1004  # GetSPL/RemoveSPL requested on an empty slot
uint32 INVALID_STATE      = 1005  # requested SPL state not in configured valid-states list

uint32 value
string message
