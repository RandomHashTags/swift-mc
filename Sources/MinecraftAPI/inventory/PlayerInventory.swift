//
//  PlayerInventory.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

public protocol PlayerInventory : Inventory {
    var helmet : (any ItemStack)? { get set }
    var chestplate : (any ItemStack)? { get set }
    var leggings : (any ItemStack)? { get set }
    var boots : (any ItemStack)? { get set }
    
    var itemInMainHand : (any ItemStack)? { get set }
    var itemInOffHand : (any ItemStack)? { get set }
    
    var held_item_slot : Int { get set }
}
