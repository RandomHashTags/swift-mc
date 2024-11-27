//
//  AttributeModifier.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol AttributeModifier : MinecraftIdentifiable, Nameable {
    var amount : Double { get }
    var operation : any AttributeModifierOperation { get }
    var slotGroup : (any EquipmentSlotGroup)? { get }
}