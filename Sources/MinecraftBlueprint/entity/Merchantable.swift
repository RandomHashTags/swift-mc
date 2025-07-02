
public protocol Merchantable: Breedable, InventoryHolderProtocol, MerchantProtocol, NPCProtocol, ~Copyable {
    var inventory: any InventoryProtocol { get }
}