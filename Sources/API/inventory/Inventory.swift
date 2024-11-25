//
//  Inventory.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol Inventory {
    var type : any InventoryType { get }
    var items : [(any ItemStack)?] { get set }
    var viewers : [any Player] { get set }
        
    func contains(_ material: any Material) -> Bool
    func contains(_ item: any ItemStack) -> Bool
    
    func first(_ material: any Material) -> (any ItemStack)?
    func first(_ item: any ItemStack) -> (any ItemStack)?
    
    func getItem(slot: Int) -> (any ItemStack)?
    mutating func setItem(slot: Int, item: (any ItemStack)?)
    mutating func setItems(items: [(any ItemStack)?])
    mutating func addItem(item: any ItemStack)
}
public extension Inventory {
    func contains(_ material: any Material) -> Bool {
        return first(material) != nil
    }
    func contains(_ item: any ItemStack) -> Bool {
        return first(item) != nil
    }
    
    /*func first(_ material: any Material) -> (any ItemStack)? {
        let identifier:String = material.id
        return items.first(where: { $0?.material?.id.elementsEqual(identifier) ?? false }) ?? nil
    }*/
    func first(_ item: any ItemStack) -> (any ItemStack)? {
        return items.first(where: { item.isSimilar($0) }) ?? nil
    }
    
    
    func getItem(slot: Int) -> (any ItemStack)? {
        return items.get(slot) ?? nil
    }
    
    mutating func setItem(slot: Int, item: (any ItemStack)?) {
        items[slot] = item
    }
    mutating func setItems(items: [(any ItemStack)?]) {
        self.items = items
    }
    
    mutating func addItem(item: (any ItemStack)) {
        // TODO: finish
    }
}
