
public protocol AttributeModifierProtocol: MinecraftIdentifiable, Nameable {
    var amount: Double { get }
    var operation: any AttributeModifierOperationProtocol { get }
    var slotGroup: (any EquipmentSlotGroupProtocol)? { get }
}