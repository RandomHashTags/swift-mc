//
//  WanderingTrader.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol WanderingTrader: Merchantable {
    /// Measured in ticks.
    var despawnDelay: Int { get }
}