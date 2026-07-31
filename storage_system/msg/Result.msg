# Result — error/status shape for all storage_system service responses.
#
# Based on the atlas_incm/storage_system reference's atlas_msgs/ErrorId shape
# (kept as naming inspiration only, not an atlas_msgs dependency — see SPECS
# doc, Decisions Log #9). Reuses the reference's numeric values for
# STORAGE_FULL/ITEM_NOT_FOUND for familiarity, and adds new codes needed for
# our own bounds/state checks that weren't present in the reference snippet.

uint32 NONE = 0

## STORAGE SYSTEM ERRORS
uint32 STORAGE_FULL       = 1000  # no free slot available (GetSlot)
uint32 ITEM_NOT_FOUND     = 1001  # requested SPL id not found in this storage
uint32 SLOT_OUT_OF_BOUNDS = 1002  # requested slot index >= capacity
uint32 SLOT_OCCUPIED      = 1003  # SetSPL requested on a non-empty slot
uint32 SLOT_EMPTY         = 1004  # GetSPL/RemoveSPL requested on an empty slot
uint32 INVALID_STATE      = 1005  # requested SPL state not in configured valid-states list

uint32 value
string message
