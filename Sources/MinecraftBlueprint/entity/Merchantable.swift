public protocol Merchantable: Breedable, InventoryHolder, Merchant, NPC {
    var inventory: any Inventory { get }
}