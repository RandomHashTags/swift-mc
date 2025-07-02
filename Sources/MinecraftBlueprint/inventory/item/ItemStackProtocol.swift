
public protocol ItemStackProtocol: Sendable, ~Copyable {
    associatedtype Material: MaterialProtocol
    associatedtype Meta: ItemMetaProtocol

    var material: Material { get }
    var meta: Meta? { get }
    var amount: Int { get }
    var durability: Int { get }
    
    /// Whether or not the two `ItemStack`s are equal, regardless of amount and durability.
    func isSimilar<T: ItemStackProtocol>(
        _ itemStack: T?
    ) -> Bool
}