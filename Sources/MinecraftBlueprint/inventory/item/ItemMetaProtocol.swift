
public protocol ItemMetaProtocol: Sendable, ~Copyable {
    associatedtype Enchantment: EnchantmentProtocol
    associatedtype Food: FoodProtocol
    associatedtype Rarity: ItemRarityProtocol

    var displayName: String? { get }
    var lore: [String] { get }
    var rarity: Rarity { get }
    var food: Food? { get }

    func hasFlag(
        _ id: MinecraftIdentifiableID
    ) -> Bool

    func getEnchant(
        _ id: MinecraftIdentifiableID
    ) -> Enchantment?
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
    public func hasFlag<T: ItemFlagProtocol>(_ flag: T) -> Bool {
        return hasFlag(flag.id)
    }

    @inlinable
    public func getEnchant<T: EnchantmentTypeProtocol>(_ type: T) -> Enchantment? {
        return getEnchant(type.id)
    }
    @inlinable
    public func hasEnchant<T: EnchantmentTypeProtocol>(_ enchant: T) -> Bool {
        return getEnchant(enchant.id) != nil
    }
}