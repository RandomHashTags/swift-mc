//
//  ItemStack.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol ItemStack : Hashable {
    /// The `Material` identifier of this itemstack.
    var materialID : String { get }
    /// The `ItemMeta` of this itemstack.
    var meta : (any ItemMeta)? { get set }
    var amount : Int { get set }
    var durability : Int { get set }
    
    /// Whether or not the two `ItemStack`s are equal, regardless of amount and durability.
    func isSimilar(_ itemStack: (any ItemStack)?) -> Bool
}