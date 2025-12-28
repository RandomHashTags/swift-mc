
public struct ItemMeta: Sendable {

    /// The item's name.
    /// Item name differs from display name in that it cannot be edited by an anvil, is not styled with italics, and does not show labels.
    public var itemName:String?

    /// The item's display name.
    public var displayName:String?

    /// The item's lore.
    public var lore:[String]

    /// Sound to play when the item is broken.
    public var breakSound:Sound?

    // Type of damage this item will deliver.
    public let damageType:DamageType?

    /// The item's rarity.
    public let rarity:ItemRarity?

    /// The item's current item flags.
    public var itemFlags:Set<ItemFlag>
}

// MARK: Booleans
extension ItemMeta {
    public var hasDamageType: Bool {
        damageType != nil
    }

    public var hasDisplayName: Bool {
        displayName != nil
    }

    public var hasLore: Bool {
        !lore.isEmpty
    }

    public var hasRarity: Bool {
        rarity != nil
    }
}

// MARK: Item Flags
extension ItemMeta {
    /// - Returns: If the flag is present on this item.
    public func hasItemFlag(_ flag: ItemFlag) -> Bool {
        itemFlags.contains(flag)
    }
}