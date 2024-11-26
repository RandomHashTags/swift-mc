//
//  PlayerInventory.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

public protocol PlayerInventory : Inventory {
    var helmet : (any ItemStack)? { get }
    var chestplate : (any ItemStack)? { get }
    var leggings : (any ItemStack)? { get }
    var boots : (any ItemStack)? { get }
    
    var itemInMainHand : (any ItemStack)? { get }
    var itemInOffHand : (any ItemStack)? { get }
    
    var held_item_slot : Int { get }
}
