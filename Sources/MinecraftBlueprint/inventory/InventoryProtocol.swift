
public protocol InventoryProtocol: Sendable, ~Copyable {
    associatedtype InventoryType: InventoryTypeProtocol
    associatedtype ItemStack: ItemStackProtocol
    associatedtype Viewer: PlayerProtocol

    var type: InventoryType { get }
    var viewers: [Viewer] { get }
        
    func contains<T: MaterialProtocol>(
        _ material: T
    ) -> Bool

    func contains<T: ItemStackProtocol>(
        _ item: T
    ) -> Bool
    
    func first<T: MaterialProtocol>(
        _ material: T
    ) -> ItemStack?

    func first<T: ItemStackProtocol>(
        _ item: T
    ) -> ItemStack?
    
    func getItem(
        slot: Int
    ) -> ItemStack?

    mutating func setItem<T: ItemStackProtocol>(
        slot: Int,
        item: T?
    )

    mutating func setItems(
        items: [ItemStack?]
    )

    mutating func addItem<T: ItemStackProtocol>(
        item: T
    )
}