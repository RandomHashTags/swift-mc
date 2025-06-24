//
//  Wither.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Wither: Boss, Monster {
    /// Measured in ticks.
    var remainingInvulnerabilityDuration: Int { get }
    
    func target(for head: any WitherHead) -> (any LivingEntity)?
}