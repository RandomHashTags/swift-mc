//
//  PotionEffect.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol PotionEffect : AnyObject, Tickable, Identifiable where ID == String {
    var typeID : String { get }
    var hasIcon : Bool { get set }
    var hasParticles : Bool { get set }
    var isAmbient : Bool { get set }
    
    var amplifier : Int { get set }
    /// Remaining duration of ticks for this potion effect.
    var duration : Int { get set }
}

public extension PotionEffect {
    func serverTPSSlowed(to tps: Int, divisor: Int) {
        duration /= divisor
    }
    func serverTPSIncreased(to tps: Int, multiplier: Int) {
        duration *= multiplier
    }
}
