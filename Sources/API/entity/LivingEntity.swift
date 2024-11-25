//
//  LivingEntity.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol LivingEntity : Damageable {
    var canBreatheUnderwater : Bool { get set }
    var canPickupItems : Bool { get set }
    var hasAI : Bool { get set }
    
    var isClimbing : Bool { get set }
    var isCollidable : Bool { get set }
    var isGliding : Bool { get set }
    var isInvisible : Bool { get set }
    var isLeashed : Bool { get set }
    var isRiptiding : Bool { get set }
    var isSleeping : Bool { get set }
    var isSwimming : Bool { get set }
    
    var potionEffects:[String : any PotionEffect] { get set }
    
    var noDamageTicks : Int { get set }
    var noDamageTicksMaximum : Int { get set }
    
    var airRemainingTicks : Int { get set }
    var airMaximumTicks : Int { get set }
        
    func tickLivingEntity(_ server: any Server)
    
    func damageLivingEntity(cause: DamageCause, amount: Double) -> DamageResult
}

public extension LivingEntity {
    
    func tick(_ server: any Server) {
        tickLivingEntity(server)
    }
    func tickLivingEntity(_ server: any Server) {
        defaultTickLivingEntity(server)
    }
    func defaultTickLivingEntity(_ server: any Server) {
        //ServerMojang.instance.logger.info("LivingEntity;defaultTickLivingEntity;living entity with uuid \(uuid) has been ticked")
        if noDamageTicks > 0 {
            noDamageTicks -= 1
        }
        
        var removed_potion_effects:Set<String> = Set<String>()
        for identifier in potionEffects.keys {
            potionEffects[identifier]!.tick(server)
            if potionEffects[identifier]!.duration == 0 {
                removed_potion_effects.insert(identifier)
            }
        }
        for identifier in removed_potion_effects {
            potionEffects.removeValue(forKey: identifier)
        }
        
        tickDamageable(server)
    }
    
    func damageLivingEntity(cause: DamageCause, amount: Double) -> DamageResult {
        let result:DamageResult = damage(cause: cause, amount: amount)
        if noDamageTicks == 0 {
            noDamageTicks = noDamageTicksMaximum
        }
        return result
    }
}

public extension LivingEntity {
    func serverTPSSlowed(to tps: Int, divisor: Int) {
        living_entity_server_tps_slowed(to: tps, divisor: divisor)
    }
    internal func living_entity_server_tps_slowed(to tps: Int, divisor: Int) {
        noDamageTicks /= divisor
        noDamageTicksMaximum /= divisor
        
        if airRemainingTicks != airMaximumTicks {
            airRemainingTicks /= divisor
            airMaximumTicks /= divisor
        } else {
            airMaximumTicks /= divisor
            airRemainingTicks = airMaximumTicks
        }
        
        for potionEffect in potionEffects.values {
            potionEffect.serverTPSSlowed(to: tps, divisor: divisor)
        }
        (self as any Entity).serverTPSSlowed(to: tps, divisor: divisor)
    }
    
    func serverTPSIncreased(to tps: Int, multiplier: Int) {
        living_entity_server_tps_increased(to: tps, multiplier: multiplier)
    }
    internal func living_entity_server_tps_increased(to tps: Int, multiplier: Int) {
        noDamageTicks *= multiplier
        noDamageTicksMaximum *= multiplier
        
        airRemainingTicks *= multiplier
        airMaximumTicks *= multiplier
        
        for potionEffect in potionEffects.values {
            potionEffect.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
        (self as any Entity).serverTPSIncreased(to: tps, multiplier: multiplier)
    }
}

public enum LivingEntityCodingKeys : CodingKey {
    case canBreatheUnderwater
    case canPickupItems
    case hasAI
    
    case isClimbing
    case isCollidable
    case isGliding
    case isInvisible
    case isLeashed
    case isRiptiding
    case isSleeping
    case isSwimming

    case potionEffects
    
    case noDamageTicks
    case noDamageTicksMaximum
    
    case air_remaining
    case air_maximum
}
