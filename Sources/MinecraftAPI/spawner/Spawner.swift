//
//  Spawner.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Spawner {
    /// Measured in ticks.
    var delay: Int { get }

    /// Measured in blocks squared.
    var requiredPlayerRange: Int { get }

    /// Measured in blocks.
    var spawnRadius: Int { get }
}