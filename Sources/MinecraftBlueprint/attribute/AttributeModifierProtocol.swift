
public protocol AttributeModifierProtocol: MinecraftIdentifiable, Nameable {
    associatedtype Operation: AttributeModifierOperationProtocol

    var amount: Double { get }
    var operation: Operation { get }
    var slotGroup: (any EquipmentSlotGroupProtocol)? { get }
}