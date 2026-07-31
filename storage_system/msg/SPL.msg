# SPL — the item type tracked by StorageSystem.
#
# id: unique identifier for the SPL (e.g. from QR/barcode scan, or assigned on
#     population). -1 means "unassigned/unknown".
# state: opaque lifecycle state string, e.g. "NEW", "IN_PROCESS", "DONE".
#     StorageSystem does not interpret/branch on this value, it only stores
#     and reports it (mirrors how the atlas_incm/storage_system reference
#     treats item states as pure data, only ever compared against a
#     configured valid-states list). Kept as a free-form string for now
#     (see SPECS doc, Open Item 1) — refine to a fixed enum later without any
#     code-shape impact.

int32 id
string state
