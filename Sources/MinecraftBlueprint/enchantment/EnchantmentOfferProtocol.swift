
public protocol EnchantmentOfferProtocol: Sendable, ~Copyable {
    /// The `Enchantment` of this offer.
    var enchant: any EnchantmentProtocol { get }
    
    /// The amount of experience levels this offer costs.
    var cost: Int { get }
}