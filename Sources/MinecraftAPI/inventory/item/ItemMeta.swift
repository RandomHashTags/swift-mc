//
//  ItemMeta.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol ItemMeta {
    var displayName: String? { get }
    var lore: [String] { get }
    var rarity: any ItemRarity { get }
    var food: (any Food)? { get }

    func hasFlag(_ id: MinecraftIdentifiableID) -> Bool
    func getEnchant(_ id: MinecraftIdentifiableID) -> (any Enchantment)?
}

public extension ItemMeta {
    var hasDisplayName: Bool { displayName != nil }

    var hasLore: Bool { !lore.isEmpty }

    func hasFlag(_ flag: any ItemFlag) -> Bool {
        return hasFlag(flag.id)
    }

    func getEnchant(_ type: any EnchantmentType) -> (any Enchantment)? {
        return getEnchant(type.id)
    }
    func hasEnchant(_ enchant: any EnchantmentType) -> Bool {
        return getEnchant(enchant.id) != nil
    }
}