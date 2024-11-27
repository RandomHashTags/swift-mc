//
//  EquipmentSlot.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol EquipmentSlot : MinecraftIdentifiable {
    var group : any EquipmentSlotGroup { get }
}