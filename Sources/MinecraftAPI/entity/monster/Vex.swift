//
//  Vex.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Vex : Monster {
    var boundLocation : (any Location)? { get }
    /// Measured in ticks.
    var remainingLifespan : Int { get }
    var hasLimitedLifespan : Bool { get }
    var isCharging : Bool { get }
}