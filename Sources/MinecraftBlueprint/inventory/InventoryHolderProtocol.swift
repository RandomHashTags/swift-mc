
/// Indicates the holder contains an inventory.
public protocol InventoryHolderProtocol: Sendable, ~Copyable {
    associatedtype Inventory: InventoryProtocol
}