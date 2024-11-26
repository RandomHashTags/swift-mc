//
//  EntityDamageEvent.swift
//  
//
//  Created by Evan Anderson on 2/11/23.
//

public protocol EntityDamageEvent : EntityEventCancellable {
    var cause : DamageCause { get }
    var amount : Double { get set }
    var willDie : Bool { get }
    
    init(entity: any Entity, cause: DamageCause, amount: Double)
}
