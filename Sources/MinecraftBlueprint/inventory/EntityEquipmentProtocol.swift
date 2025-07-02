
public protocol EntityEquipmentProtocol: Sendable, ~Copyable {
    func item(
        for slot: any EquipmentSlotProtocol
    ) -> (any ItemStackProtocol)?

    func itemDropChance(
        for slot: any EquipmentSlotProtocol
    ) -> Float

    func setItem(
        for slot: any EquipmentSlotProtocol,
        silent: Bool,
        item: (any ItemStackProtocol)?
    )

    func clear()
}