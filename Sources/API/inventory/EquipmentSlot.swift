
public enum EquipmentSlot: CaseIterable, Sendable {
    /// Only for certain entities such as horses and wolves.
    case body

    case chest
    case feet
    case hand
    case head
    case legs
    case offhand

    /// Only for certain entities such as horses and pigs.
    case saddle
}

// MARK: Group
extension EquipmentSlot {
    /// The `EquipmentSlotGroup` corresponding to this slot.
    public var group: EquipmentSlotGroup {
        // TODO: fix
        .any
    }
}