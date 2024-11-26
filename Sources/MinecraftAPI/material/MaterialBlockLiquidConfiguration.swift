//
//  MaterialBlockLiquidConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol MaterialBlockLiquidConfiguration : AnyObject, Hashable, ServerTickChangeListener {
    /// [`World` name : distance per tick]
    var distancesPerTick : [String : Double] { get set }
}

public extension MaterialBlockLiquidConfiguration {
    func serverTPSSlowed(to tps: Int, divisor: Int) {
        let divisor:Double = Double(divisor)
        for world_name in distancesPerTick.keys {
            distancesPerTick[world_name]! /= divisor
        }
    }
    func serverTPSIncreased(to tps: Int, multiplier: Int) {
        let multiplier:Double = Double(multiplier)
        for world_name in distancesPerTick.keys {
            distancesPerTick[world_name]! *= multiplier
        }
    }
}

public extension MaterialBlockLiquidConfiguration {
    static func == (left: any MaterialBlockLiquidConfiguration, right: any MaterialBlockLiquidConfiguration) -> Bool {
        return left.distancesPerTick == right.distancesPerTick
    }
    static func == (left: Self, right: Self) -> Bool {
        return left.distancesPerTick == right.distancesPerTick
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(distancesPerTick)
    }
}
