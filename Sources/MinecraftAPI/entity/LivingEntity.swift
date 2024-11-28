//
//  LivingEntity.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Foundation

public protocol LivingEntity : Attributable, Damageable, ProjectileSource {
    var canBreatheUnderwater : Bool { get }
    var canPickupItems : Bool { get }
    /// The exempt `Entity` UUIDs where collision between this entity and them will be ignored.
    var collidableExemptions : Set<UUID> { get }

    var hasAI : Bool { get }
    
    var isClimbing : Bool { get }
    var isCollidable : Bool { get }
    var isGliding : Bool { get }
    var isInvisible : Bool { get }
    var isLeashed : Bool { get }
    var isRiptiding : Bool { get }
    var isSleeping : Bool { get }
    var isSwimming : Bool { get }

    var deathSound : (any Sound)? { get }
    var hurtSound : (any Sound)? { get }
    func fallDamageSound(fallHeight: Int) -> (any Sound)?

    var equipment : (any EntityEquipment)? { get }
    var eyeHeight : Double { get }
    var eyeLocation : any Location { get }
    
    var potionEffects:[any PotionEffect] { get } // TODO: make Set
    
    var noActionTicks : Int { get }
    var noDamageTicks : Int { get }
    var noDamageTicksMaximum : Int { get }

    // Measured in ticks.
    var remainingAirDuration : Int { get }
    var airMaximumTicks : Int { get }

    var removeWhenFarAway : Bool { get }

    /// Measured in ticks.
    var arrowCooldown : Int { get }
    var arrowsInBody : [any Entity] { get } // TODO: make Set
        
    mutating func tickLivingEntity(_ server: any Server)
    
    mutating func damageLivingEntity(cause: any DamageCause, amount: Double) -> DamageResult
}