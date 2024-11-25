//
//  GluonPlayerInventory.swift
//  
//
//  Created by Evan Anderson on 4/26/23.
//

struct GluonPlayerInventory : PlayerInventory {
    var type:any InventoryType
    
    var helmet:(ItemStack)?
    var chestplate:(ItemStack)?
    var leggings:(ItemStack)?
    var boots:(ItemStack)?
    
    var itemInMainHand:(ItemStack)?
    var itemInOffHand:(ItemStack)?
    
    var held_item_slot:Int
    
    var items:[(ItemStack)?]
    var viewers:[any Player]
    
    init(type: any InventoryType, held_item_slot: Int, items: [(ItemStack)?], viewers: [any Player]) {
        self.type = type
        self.held_item_slot = held_item_slot
        self.items = items
        self.viewers = viewers
    }
}
