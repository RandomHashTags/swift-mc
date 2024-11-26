//
//  EntityType.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol EntityType : MinecraftIdentifiable, Nameable, ServerTickChangeListener {
    var isAffectedByGravity : Bool { get }
    var isDamageable : Bool { get }

    var receivesFallDamage : Bool { get }

    var noDamageTicksMaximum : Int { get }
    var fireTicksMaximum : Int { get }
    var freezeTicksMaximum : Int { get }
}