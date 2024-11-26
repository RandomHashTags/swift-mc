//
//  Damageable.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Logging

public protocol Damageable : Entity {
    var health : Double { get }
    var healthMaximum : Double { get }
        
    func tickDamageable(_ server: any Server)
    
    func damage(cause: any DamageCause, amount: Double) -> DamageResult
}