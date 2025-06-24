//
//  MaterialBlockLiquidConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol MaterialBlockLiquidConfiguration: ServerTickChangeListener {
    /// [`World` name: distance per tick]
    var distancesPerTick: [String: Double] { get }
}