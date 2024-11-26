//
//  EntityType.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol EntityType : Identifiable, Nameable, ServerTickChangeListener where ID == String {
    var isAffectedByGravity : Bool { get }
    var isDamageable : Bool { get }

    var receivesFallDamage : Bool { get }

    var noDamageTicksMaximum : Int { get set }
    var fireTicksMaximum : Int { get set }
    var freezeTicksMaximum : Int { get set }
}

public extension EntityType {
    mutating func serverTPSSlowed(to tps: Int, divisor: Int) {
        noDamageTicksMaximum /= divisor
        fireTicksMaximum /= divisor
        freezeTicksMaximum /= divisor
    }
    mutating func serverTPSIncreased(to tps: Int, multiplier: Int) {
        noDamageTicksMaximum *= multiplier
        fireTicksMaximum *= multiplier
        freezeTicksMaximum *= multiplier
    }
}