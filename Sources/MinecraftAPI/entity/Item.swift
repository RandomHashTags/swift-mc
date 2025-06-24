//
//  Item.swift
//  
//
//  Created by Evan Anderson on 2/16/23.
//

public protocol Item: Entity {
    var itemStack: any ItemStack { get }
    var pickupDelay: UInt8 { get }
    
    func tickItem(_ server: any Server)
}
