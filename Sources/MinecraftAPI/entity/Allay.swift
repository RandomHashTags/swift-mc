//
//  Allay.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Allay : Creature, InventoryHolder {
    var inventory : any Inventory { get }

    var canDuplicate : Bool { get }
    /// Measured in ticks.
    var duplicationCooldown : Int { get }

    var isDancing : Bool { get }
    var dancingSourceLocation : (any Location)? { get }
}