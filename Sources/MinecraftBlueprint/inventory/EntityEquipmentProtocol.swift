
public protocol EntityEquipmentProtocol: Sendable, ~Copyable {
    func item<T: EquipmentSlotProtocol>(
        for slot: T
    ) -> (any ItemStackProtocol)?

    func itemDropChance<T: EquipmentSlotProtocol>(
        for slot: T
    ) -> Float

    func setItem<T: EquipmentSlotProtocol, I: ItemStackProtocol>(
        for slot: T,
        silent: Bool,
        item: I?
    )

    func clear()
}