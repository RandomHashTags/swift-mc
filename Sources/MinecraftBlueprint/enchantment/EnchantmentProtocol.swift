
public protocol EnchantmentProtocol: Sendable, ~Copyable {
    associatedtype EnchantmentType: EnchantmentTypeProtocol

    /// The level of this enchantment.
    var level: Int { get }

    /// The `EnchantmentType` of this enchantment.
    var type: EnchantmentType { get }
}