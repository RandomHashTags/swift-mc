//
//  EntityDamageEvent.swift
//  
//
//  Created by Evan Anderson on 2/11/23.
//

public protocol EntityDamageEvent: EntityEventCancellable {
    var cause: any DamageCause { get }
    var source: any DamageSource { get }
    var damage: Double { get }
    var finalDamage: Double { get }
    
    init(entity: any Entity, cause: any DamageCause, damage: Double)
}