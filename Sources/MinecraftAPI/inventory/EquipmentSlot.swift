public protocol EquipmentSlot: MinecraftIdentifiable {
    var group: any EquipmentSlotGroup { get }
}