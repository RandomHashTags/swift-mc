
public protocol ItemMeta: Sendable, ~Copyable {
    var displayName: String? { get }
    var lore: [String] { get }
    var rarity: any ItemRarity { get }
    var food: (any Food)? { get }

    func hasFlag(_ id: MinecraftIdentifiableID) -> Bool
    func getEnchant(_ id: MinecraftIdentifiableID) -> (any Enchantment)?
}

extension ItemMeta {
    @inlinable
    public var hasDisplayName: Bool {
        displayName != nil
    }

    @inlinable
    public var hasLore: Bool {
        !lore.isEmpty
    }

    @inlinable
    public func hasFlag(_ flag: any ItemFlag) -> Bool {
        return hasFlag(flag.id)
    }

    @inlinable
    public func getEnchant(_ type: any EnchantmentType) -> (any Enchantment)? {
        return getEnchant(type.id)
    }
    @inlinable
    public func hasEnchant(_ enchant: any EnchantmentType) -> Bool {
        return getEnchant(enchant.id) != nil
    }
}