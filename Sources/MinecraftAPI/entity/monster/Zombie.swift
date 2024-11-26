//
//  Zombie.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Zombie : Monster, Ageable {
    var canBreakDoors : Bool { get }
    /// Measured in ticks.
    var remainingConversionDuration : Int { get }
    var isConverting : Bool { get }
}

public extension Zombie {
    var isConverting : Bool { remainingConversionDuration > 0 }
}