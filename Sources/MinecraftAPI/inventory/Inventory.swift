//
//  Inventory.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol Inventory {
    var type : any InventoryType { get }
    var viewers : [any Player] { get }
        
    func contains(_ material: any Material) -> Bool
    func contains(_ item: any ItemStack) -> Bool
    
    func first(_ material: any Material) -> (any ItemStack)?
    func first(_ item: any ItemStack) -> (any ItemStack)?
    
    func getItem(slot: Int) -> (any ItemStack)?
    mutating func setItem(slot: Int, item: (any ItemStack)?)
    mutating func setItems(items: [(any ItemStack)?])
    mutating func addItem(item: any ItemStack)
}