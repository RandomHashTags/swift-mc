
public protocol EntityEquipment: Sendable, ~Copyable {
    func item(for slot: any EquipmentSlot) -> (any ItemStack)?
    func itemDropChance(for slot: any EquipmentSlot) -> Float

    func setItem(for slot: any EquipmentSlot, silent: Bool, item: (any ItemStack)?)
    func clear()
}