//
//  ServerTickChangeListener.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol ServerTickChangeListener {
    mutating func serverTPSSlowed(to tps: UInt8, divisor: UInt16)
    mutating func serverTPSIncreased(to tps: UInt8, multiplier: UInt16)
}
