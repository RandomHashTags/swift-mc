
public protocol ItemStackProtocol: Sendable, ~Copyable {
    var material: any MaterialProtocol { get }
    var meta: (any ItemMetaProtocol)? { get }
    var amount: Int { get }
    var durability: Int { get }
    
    /// Whether or not the two `ItemStack`s are equal, regardless of amount and durability.
    func isSimilar(_ itemStack: (any ItemStackProtocol)?) -> Bool
}