
public protocol Merchantable: Breedable, InventoryHolder, Merchant, NPC, ~Copyable {
    var inventory: any Inventory { get }
}