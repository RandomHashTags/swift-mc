
/// Applicable targets for an `Enchantment`.
public enum EnchantmentTarget: String, CaseIterable, Sendable {
    /// Allows the enchantment to be applied to armor.
    case armor

    /// Allows the enchantment to be applied to the feet slot.
    case armorFeet

    /// Allows the enchantment to be applied to the head slot.
    case armorHead

    /// Allows the enchantment to be applied to the leg slot.
    case armorLegs

    /// Allows the enchantment to be applied to the torso slot.
    case armorTorso

    /// Allows the enchantment to be applied to bows.
    case bow

    /// Allows the enchantment to be applied to items with durability.
    case breakable

    /// Allows the enchantment to be applied to crossbows.
    case crossbow

    /// Allows the enchantment to be applied to fishing rods.
    case fishingRod

    /// Allows the enchantment to be applied to tools (axes, pickaxes, shovels, etc).
    case tool
    
    /// Allows the enchantment to be applied to tridents.
    case trident

    /// Allows the enchantment to be applied to vanishing items.
    case vanishable

    /// Allows the enchantment to be applied to weapons (swords).
    case weapon

    /// Allows the enchantment to be applied to wearable items.
    case wearable
}

// MARK: Includes
extension EnchantmentTarget {
    /// Whether this target is applicable to the specified item.
    public func includes(_ itemstack: ItemStack) -> Bool {
        // TODO: fix
        return false
    }

    /// Whether this target is applicable to the specified material.
    public func includes(_ material: Material) -> Bool {
        // TODO: fix
        return false
    }
}