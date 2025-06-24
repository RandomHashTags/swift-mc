//
//  EnchantmentOffer.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol EnchantmentOffer {
    /// The `Enchantment` of this offer.
    var enchant: any Enchantment { get }
    
    /// The amount of experience levels this offer costs.
    var cost: Int { get }
}