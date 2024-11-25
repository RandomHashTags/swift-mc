//
//  GluonMaterialItemConfiguration.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

struct GluonMaterialItemConfiguration : MaterialItemConfiguration {
    let itemStackSizeMaximum:Int
    
    let hasDurability:Bool
    let durability:UInt
    
    let consumable:(any MaterialItemConsumableConfiguration)?
    
    let attackDamage:Double
    let attackDurabilityDamage:UInt
    let breakPreferredBlockDurabilityDamage:UInt
    let break_nonpreferred_block_durability_damage:UInt
    
    let placeBlockWhitelist:Set<String>?
    let placeBlockBlacklist:Set<String>?
}
