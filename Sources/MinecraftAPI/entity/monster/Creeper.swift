//
//  Creeper.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Creeper : Monster {
    /// Measured in blocks.
    var explosionRadius : Int { get }

    /// Measured in ticks.
    var fuseDuration : Int { get }

    /// Measured in ticks.
    var maxFuseDuration : Int { get }

    var igniter : (any Entity)? { get }

    var isCharged : Bool { get }

    func explode()
    func ignite(igniter: (any Entity)?)
}