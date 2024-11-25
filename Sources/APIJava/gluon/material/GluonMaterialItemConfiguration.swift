//
//  GluonMaterialItemConfiguration.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

struct GluonMaterialItemConfiguration : MaterialItemConfiguration {
    let item_stack_size_maximum:Int
    
    let has_durability:Bool
    let durability:UInt
    
    let consumable:(any MaterialItemConsumableConfiguration)?
    
    let attack_damage:Double
    let attack_durability_damage:UInt
    let break_preferred_block_durability_damage:UInt
    let break_nonpreferred_block_durability_damage:UInt
    
    let place_block_whitelist:Set<String>?
    let place_block_blacklist:Set<String>?
}
