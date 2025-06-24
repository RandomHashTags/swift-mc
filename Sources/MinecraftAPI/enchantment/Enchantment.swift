//
//  Enchantmet.swift
//  
//
//  Created by Evan Anderson on 11/28/24.
//

public protocol Enchantment {
    /// The level of this enchantment.
    var level: Int { get }

    /// The `EnchantmentType` of this enchantment.
    var type: any EnchantmentType { get }
}