//
//  Merchantable.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Merchantable : Breedable, InventoryHolder, Merchant, NPC {
    var inventory : any Inventory { get }
}