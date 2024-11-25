//
//  Damageable.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Logging

public protocol Damageable : Entity {
    var health : Double { get set }
    var health_maximum : Double { get set }
        
    func tick_damageable(_ server: any Server)
    
    func damage(cause: DamageCause, amount: Double) -> DamageResult
}
public extension Damageable {
    
    func tick(_ server: any Server) {
        tick_damageable(server)
    }
    func tick_damageable(_ server: any Server) {
        default_tick_damageable(server)
    }
    func default_tick_damageable(_ server: any Server) {
        //ServerMojang.instance.logger.info(Logger.Message(stringLiteral: "Damageable;default_tick_damageable;damageable with uuid " + uuid.uuidString + " has been ticked"))
        if fire_ticks > 0 {
            fire_ticks -= 1
            if fire_ticks != 0 && fire_ticks % UInt16(server.ticksPerSecond) == 0 {
                let result:DamageResult = damage(cause: DamageCause.fire_tick, amount: server.fireDamagePerSecond)
            }
        }
        if freeze_ticks > 0 {
            freeze_ticks -= 1
        }
        
        let world:any World = location.world
        let y:Double = location.y
        if Int(y) < world.y_min {
            let result:DamageResult = damage(cause: DamageCause.void, amount: server.voidDamagePerTick)
        }
        
        tick_entity(server)
    }
    
    func damage(cause: DamageCause, amount: Double) -> DamageResult {
        let new_health:Double = max(0, min(health-amount, health_maximum))
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
    }
}

public enum DamageableCodingKeys : CodingKey {
    case health
    case health_maximum
}
