
public protocol ItemMetaProtocol: Sendable, ~Copyable {
    var displayName: String? { get }
    var lore: [String] { get }
    var rarity: any ItemRarityProtocol { get }
    var food: (any FoodProtocol)? { get }

    func hasFlag(_ id: MinecraftIdentifiableID) -> Bool
    func getEnchant(_ id: MinecraftIdentifiableID) -> (any EnchantmentProtocol)?
}

extension ItemMetaProtocol {
    @inlinable
    public var hasDisplayName: Bool {
        displayName != nil
    }

    @inlinable
    public var hasLore: Bool {
        !lore.isEmpty
    }

    @inlinable
    public func hasFlag(_ flag: any ItemFlagProtocol) -> Bool {
        return hasFlag(flag.id)
    }

    @inlinable
    public func getEnchant(_ type: any EnchantmentTypeProtocol) -> (any EnchantmentProtocol)? {
        return getEnchant(type.id)
    }
    @inlinable
    public func hasEnchant(_ enchant: any EnchantmentTypeProtocol) -> Bool {
        return getEnchant(enchant.id) != nil
    }
}