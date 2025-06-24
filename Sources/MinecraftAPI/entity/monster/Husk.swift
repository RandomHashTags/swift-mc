//
//  Husk.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Husk: Zombie {
    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }
}

public extension Husk {
    var isConverting: Bool { remainingConversionDuration > 0 }
}