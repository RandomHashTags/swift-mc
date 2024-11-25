//
//  GluonMaterialBlockConfiguration.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

struct GluonMaterialBlockConfiguration : MaterialBlockConfiguration {
    let blockMoveReaction:BlockMoveReaction
    
    let growable:MaterialBlockGrowableConfiguration?
    
    let liquid:(any MaterialBlockLiquidConfiguration)?
    
    let canPassthrough:Bool
    let passthroughVelocityDampenX:Float
    let passthroughVelocityDampenY:Float
    let passthroughVelocityDampenZ:Float
    
    let breaks_fall:Bool
    
    let resistance:Int
    let hardness:Float
    let preferred_break_material_identifiers:Set<String>?
    var preferredBreakMaterials : [Material]? {
        guard let identifiers:Set<String> = preferred_break_material_identifiers else { return nil }
        return GluonServer.shared.get_materials(identifiers: identifiers)
    }
    
    let loot:(LootTable)?
}
