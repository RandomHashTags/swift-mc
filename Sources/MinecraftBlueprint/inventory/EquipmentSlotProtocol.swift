
public protocol EquipmentSlotProtocol: MinecraftIdentifiable {
    associatedtype Group: EquipmentSlotGroupProtocol

    var group: Group { get }
}