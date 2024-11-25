//
//  EnchantmentOffer.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol EnchantmentOffer : Hashable {
    /// The `EnchantmentType` identifier of this offer.
    var typeID : String { get }
    var type : (any EnchantmentType)? { get }
    /// The level of the enchantment type for this offer.
    var level : Int { get }
    /// The amount of experience levels this offer costs.
    var cost : Int { get }
}