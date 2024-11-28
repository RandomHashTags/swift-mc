//
//  ItemStack.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol ItemStack {
    var material : any Material { get }
    var meta : (any ItemMeta)? { get }
    var amount : Int { get }
    var durability : Int { get }
    
    /// Whether or not the two `ItemStack`s are equal, regardless of amount and durability.
    func isSimilar(_ itemStack: (any ItemStack)?) -> Bool
}