//
//  LivingEntity.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol LivingEntity : Damageable {
    var canBreatheUnderwater : Bool { get }
    var canPickupItems : Bool { get }
    var hasAI : Bool { get }
    
    var isClimbing : Bool { get }
    var isCollidable : Bool { get }
    var isGliding : Bool { get }
    var isInvisible : Bool { get }
    var isLeashed : Bool { get }
    var isRiptiding : Bool { get }
    var isSleeping : Bool { get }
    var isSwimming : Bool { get }
    
    var potionEffects:[String : any PotionEffect] { get }
    
    var noDamageTicks : Int { get }
    var noDamageTicksMaximum : Int { get }
    
    var airRemainingTicks : Int { get }
    var airMaximumTicks : Int { get }
        
    func tickLivingEntity(_ server: any Server)
    
    func damageLivingEntity(cause: any DamageCause, amount: Double) -> DamageResult
}