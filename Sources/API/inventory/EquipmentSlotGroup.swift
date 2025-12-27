
public enum EquipmentSlotGroup: CaseIterable, Hashable, Sendable {
    case any
    case armor
    case chest
    case feet
    case hand
    case head
    case legs
    case mainhand
    case offhand
    case saddle
}

// MARK: Test
extension EquipmentSlotGroup {
    public func test(_ slot: EquipmentSlot) -> Bool {
        // TODO: fix
        false
    }
}