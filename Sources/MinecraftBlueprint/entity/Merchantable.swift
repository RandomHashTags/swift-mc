
public protocol Merchantable: Breedable, InventoryHolderProtocol, MerchantProtocol, NPCProtocol, ~Copyable {
    var inventory: Inventory { get }
}