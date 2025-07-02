
public protocol Enchantment: Sendable, ~Copyable {
    /// The level of this enchantment.
    var level: Int { get }

    /// The `EnchantmentType` of this enchantment.
    var type: any EnchantmentType { get }
}