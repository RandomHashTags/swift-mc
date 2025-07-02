
public protocol PlayerInventory: Inventory, ~Copyable {
    var helmet: (any ItemStack)? { get }
    var chestplate: (any ItemStack)? { get }
    var leggings: (any ItemStack)? { get }
    var boots: (any ItemStack)? { get }
    
    var itemInMainHand: (any ItemStack)? { get }
    var itemInOffHand: (any ItemStack)? { get }
    
    var heldItemSlot: Int { get }
}