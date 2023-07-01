//
//  MaterialItemConsumableConfiguration.swift
//  
//
//  Created by Evan Anderson on 3/5/23.
//

import Foundation

public protocol MaterialItemConsumableConfiguration : AnyObject, ServerTickChangeListener, Identifiable where ID == String {
    /// Amount of ticks required of consuming to consider this item to be consumed.
    var duration : UInt64 { get set }
    /// The logic executed when this item is considered consumed.
    var executable_logic : [ExecutableLogic] { get }
}

public extension MaterialItemConsumableConfiguration {
    func server_tps_slowed(to tps: UInt8, divisor: UInt16) {
        duration /= UInt64(divisor)
    }
    func server_tps_increased(to tps: UInt8, multiplier: UInt16) {
        duration *= UInt64(multiplier)
    }
}
