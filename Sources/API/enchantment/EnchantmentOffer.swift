//
//  EnchantmentOffer.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol EnchantmentOffer : Hashable {
    var typeID : String { get }
    var type : EnchantmentType? { get set }
    /// The enchantment level of ``EnchantmentType``of this offer.
    var level : UInt16 { get set }
    /// The amount of experience levels this offer costs.
    var cost : UInt16 { get set }
}

public extension EnchantmentOffer {
    func hash(into hasher: inout Hasher) {
        hasher.combine(typeID)
        hasher.combine(level)
        hasher.combine(cost)
    }
}
