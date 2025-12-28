
/// An offer from the enchantment table.
public struct EnchantmentOffer: Sendable {
    /// Cost of the offer which is displayed as a number on the right hand side of the enchantment.
    public var cost:Int

    /// Type of enchantment for this offer.
    public var enchantment:Enchantment

    /// Level of the offered enchantment for this offer.
    public var enchantmentLevel:Int
}