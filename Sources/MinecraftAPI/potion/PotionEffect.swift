//
//  PotionEffect.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol PotionEffect: MinecraftIdentifiable, Tickable {
    var type: any PotionEffectType { get }
    var hasIcon: Bool { get }
    var hasParticles: Bool { get }
    var isAmbient: Bool { get }
    var isInfinite: Bool { get }
    
    var amplifier: Int { get }

    /// Remaining duration, measured in ticks, for this potion effect.
    var duration: Int { get }
}