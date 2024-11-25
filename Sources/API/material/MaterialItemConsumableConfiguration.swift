//
//  MaterialItemConsumableConfiguration.swift
//  
//
//  Created by Evan Anderson on 3/5/23.
//

public protocol MaterialItemConsumableConfiguration : AnyObject, ServerTickChangeListener, Identifiable where ID == String {
    /// Amount of ticks required of consuming to consider this item to be consumed.
    var duration : UInt64 { get set }
    
    var nutrition : Int { get }
    var saturation_modifier : Float { get }
    var effects : [any PotionEffect] { get }
}

public extension MaterialItemConsumableConfiguration {
    func serverTPSSlowed(to tps: UInt8, divisor: UInt16) {
        duration /= UInt64(divisor)
    }
    func serverTPSIncreased(to tps: UInt8, multiplier: UInt16) {
        duration *= UInt64(multiplier)
    }
}
