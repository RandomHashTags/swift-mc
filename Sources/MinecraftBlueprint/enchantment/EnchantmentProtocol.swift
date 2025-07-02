
public protocol EnchantmentProtocol: Sendable, ~Copyable {
    /// The level of this enchantment.
    var level: Int { get }

    /// The `EnchantmentType` of this enchantment.
    var type: any EnchantmentTypeProtocol { get }
}