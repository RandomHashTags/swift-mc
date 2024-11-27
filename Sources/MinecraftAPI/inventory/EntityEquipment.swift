//
//  EntityEquipment.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol EntityEquipment {
    func item(for slot: any EquipmentSlot) -> (any ItemStack)?
    func itemDropChance(for slot: any EquipmentSlot) -> Float

    func setItem(for slot: any EquipmentSlot, silent: Bool, item: (any ItemStack)?)
    func clear()
}