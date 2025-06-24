//
//  Ageable.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Ageable: Creature {
    /// Measured in ticks.
    var age: Int { get }
    var isAdult: Bool { get }
}