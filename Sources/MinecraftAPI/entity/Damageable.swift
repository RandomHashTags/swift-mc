//
//  Damageable.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Logging

public protocol Damageable : Entity {
    var health : Double { get }
        
    mutating func tickDamageable(_ server: any Server)
    
    mutating func damage(cause: any DamageCause, amount: Double) -> DamageResult
}