
public protocol PlayerInventoryProtocol: InventoryProtocol, ~Copyable {
    var helmet: (any ItemStackProtocol)? { get }
    var chestplate: (any ItemStackProtocol)? { get }
    var leggings: (any ItemStackProtocol)? { get }
    var boots: (any ItemStackProtocol)? { get }
    
    var itemInMainHand: (any ItemStackProtocol)? { get }
    var itemInOffHand: (any ItemStackProtocol)? { get }
    
    var heldItemSlot: Int { get }
}