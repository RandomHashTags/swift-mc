
public protocol MaterialItemConfigurationProtocol: Sendable, ~Copyable {
    /// Maximum amount of the same item that can be stacked in one slot.
    var maxStackSize: Int { get }
    
    /// Whether or not this item has durability.
    var hasDurability: Bool { get }
    
    /// The item's maximum durability.
    var maxDurability: Int { get }

    /// The item's consumable configuration.
    var consumable: (any MaterialItemConsumableConfigurationProtocol)? { get }
    
    /// Amount of health points this item inflicts to a `LivingEntity`.
    var attackDamage: Double { get }

    /// Amount of durability to reduced this item by when attacking a `LivingEntity`.
    var attackDurabilityDamage: Int { get }

    /// Amount of durability to reduce an item of the material by if the block broken does prefer the item's material.
    var breakPreferredBlockDurabilityDamage: Int { get }

    /// Amount of durability to reduce an item of this material by if the block broken doesn't prefer the item's material.
    var breakNonpreferredBlockDurabilityDamage: Int { get }
    
    /// The `Material` identifiers this item can only be placed on.
    var placeBlockWhitelist: Set<String>? { get }

    /// The `Material` identifiers this item cannot be placed on.
    var placeBlockBlacklist: Set<String>? { get }
}
