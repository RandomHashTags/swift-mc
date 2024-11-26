//
//  ServerTickChangeListener.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol ServerTickChangeListener {
    mutating func serverTPSSlowed(to tps: Int, divisor: Int)
    mutating func serverTPSIncreased(to tps: Int, multiplier: Int)
}
