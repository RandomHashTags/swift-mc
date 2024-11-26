//
//  Damageable.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Logging

public protocol Damageable : Entity {
    var health : Double { get set }
    var healthMaximum : Double { get set }
        
    func tickDamageable(_ server: any Server)
    
    func damage(cause: DamageCause, amount: Double) -> DamageResult
}
public extension Damageable {
    
    func tick(_ server: any Server) {
        tickDamageable(server)
    }
    func tickDamageable(_ server: any Server) {
        defaultTickDamageable(server)
    }
    func defaultTickDamageable(_ server: any Server) {
        //ServerMojang.instance.logger.info(Logger.Message(stringLiteral: "Damageable;defaultTickDamageable;damageable with uuid " + uuid.uuidString + " has been ticked"))
        if fireTicks > 0 {
            fireTicks -= 1
            if fireTicks != 0 && fireTicks % Int(server.ticksPerSecond) == 0 {
                let result:DamageResult = damage(cause: DamageCause.fireTick, amount: server.fireDamagePerSecond)
            }
        }
        if freezeTicks > 0 {
            freezeTicks -= 1
        }
        
        let world:any World = location.world
        let y:Double = location.y
        if Int(y) < world.yMin {
            let result:DamageResult = damage(cause: DamageCause.void, amount: server.voidDamagePerTick)
        }
        
        tickEntity(server)
    }
    
    /*func damage(cause: DamageCause, amount: Double) -> DamageResult {
        let new_health:Double = max(0, min(health-amount, healthMaximum))
        let event:GluonEntityDamageEvent = GluonEntityDamageEvent(entity: self, cause: cause, amount: amount)
        GluonServer.shared.callEvent(event: event)
        guard !event.isCancelled else {
            return DamageResult.failure(.cancelled)
        }
        health = new_health
        guard health != 0 else {
            // TODO: finish
            let event:GluonEntityDeathEvent = GluonEntityDeathEvent(entity: self)
            GluonServer.shared.callEvent(event: event)
            return DamageResult.success(.killed)
        }
        return DamageResult.success(.normal)
    }*/
}

public enum DamageableCodingKeys : CodingKey {
    case health
    case healthMaximum
}
