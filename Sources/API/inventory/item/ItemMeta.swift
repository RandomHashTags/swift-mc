//
//  ItemMeta.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol ItemMeta : Hashable {
    var displayName : String? { get }
    var lore : [String]? { get }
    var flags : [any ItemFlag]? { get }
    /// [`EnchantmentType` Identifier : Enchantment Level]
    var enchants : [EnchantmentType.ID : Int]? { get }
}
public extension ItemMeta {
    static func == (left: any ItemMeta, right: any ItemMeta) -> Bool {
        guard left.displayName == right.displayName && left.lore == right.lore && left.flags?.count == right.flags?.count && left.enchants == right.enchants else { return false }
        return true // TODO: finish ItemFlag equivalence
    }
}
