//
//  MaterialBlockConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol MaterialBlockConfiguration {
    /// The reaction of this block when moved via in-game mechanics.
    var blockMoveReaction : any BlockMoveReaction { get }
    
    /// The growing configuration of this block, if it grows.
    var growable : MaterialBlockGrowableConfiguration? { get }
    
    /// The liquid configuration of this block, if it is a liquid.
    var liquid : (any MaterialBlockLiquidConfiguration)? { get }
    
    /// If entities can passthrough (walk/sprint/swim through) this block or not.
    var canPassthrough : Bool { get }
    var passthroughVelocityDampenX : Float { get }
    var passthroughVelocityDampenY : Float { get }
    var passthroughVelocityDampenZ : Float { get }
    
    /// Whether an Entity receives fall damage when falling on this block or not.
    var breaksFall : Bool { get }
    
    var blastResistance : Float { get }
    var hardness : Float { get }
    var preferredBreakMaterials : [any Material]? { get }

    var slipperiness : Float { get }

    var hasGravity : Bool { get }
    var isBurnable : Bool { get }
    var isCompostable : Bool { get }
    var isFlammable : Bool { get }
    var isInteractable : Bool { get }
    var isOccluding : Bool { get }
    var isSolid : Bool { get }
    
    /// The items that can be dropped when this block is broken.
    var loot : (any LootTable)? { get }
}
