
public protocol PlayerInventoryProtocol: InventoryProtocol, ~Copyable {
    var helmet: ItemStack? { get }
    var chestplate: ItemStack? { get }
    var leggings: ItemStack? { get }
    var boots: ItemStack? { get }
    
    var itemInMainHand: ItemStack? { get }
    var itemInOffHand: ItemStack? { get }
    
    var heldItemSlot: Int { get }
}