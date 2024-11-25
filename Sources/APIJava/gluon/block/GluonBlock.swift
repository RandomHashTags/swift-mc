//
//  GluonBlock.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

/*
struct GluonBlock : Block {
    let materialID:String
    var material : (Material)? {
        return GluonServer.shared.get_material(identifier: materialID)
    }
    
    let requiresCorrectToolForDrops:Bool
    let hasCollision:Bool
    
    let instrument_id:String?
    var instrument : (Instrument)? {
        guard let instrument_id:String = instrument_id else { return nil }
        return GluonServer.shared.get_instrument(identifier: instrument_id)
    }
    
    let map_color:Color?
    
    let step_sound:(Sound)?
    
    var light_level:UInt8
    var location:any Location
    
    var growableAge:UInt8?
    
    var lootTable:(LootTable)?
    
    func tick(_ server: any Server) {
    }
    
    func break_naturally() {
        guard let loot:[ItemStack] = lootTable?.loot_normal else { return }
        let world:any World = location.world
        let pickupDelay:UInt8 = GluonServer.shared.ticksPerSecond / 2
        let half:Double = 0.5
        let item_location:any Location = location.advanced_by(x: half, y: half, z: half)
        for itemStack in loot {
            /*let item:GluonItem = GluonItem(itemStack: itemStack, pickupDelay: pickupDelay, location: item_location)
            world.spawnEntity(item)*/
        }
    }
    func get_breaking_speed(_ itemStack: ItemStack) -> Float {
       guard let block_configuration:any MaterialBlockConfiguration = material?.configuration.block else {
           return 0
       }
       let hardness:Float = block_configuration.hardness
       let is_preferred_tool:Bool = block_configuration.preferred_break_material_identifiers?.contains(itemStack.materialID) ?? false
       let tool_multiplier:Float, additional_multiplier:Float
       if is_preferred_tool {
           tool_multiplier = 1.5
           additional_multiplier = 1.0
       } else {
           tool_multiplier = 5.0
           additional_multiplier = 1.0
       }
       var penalties_multiplier:Float = 1.0
       
       return hardness * tool_multiplier * penalties_multiplier * additional_multiplier
    }
    func get_breaking_speed(_ player: any Player) -> Float {
        var speed_multiplier:Float = 1.0
        
        let potionEffects:[String:any PotionEffect] = player.potionEffects
        for (identifier, potionEffect) in potionEffects {
        }
        
        if !player.is_on_ground {
            speed_multiplier /= 5
        }
        
        var ticks:Float = 1.0
        return ticks / Float(GluonServer.shared.ticksPerSecond)
    }
}
*/
