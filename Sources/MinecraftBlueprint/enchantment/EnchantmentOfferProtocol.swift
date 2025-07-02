
public protocol EnchantmentOfferProtocol: Sendable, ~Copyable {
    associatedtype Enchantment: EnchantmentProtocol

    /// The `Enchantment` of this offer.
    var enchant: Enchantment { get }
    
    /// The amount of experience levels this offer costs.
    var cost: Int { get }
}