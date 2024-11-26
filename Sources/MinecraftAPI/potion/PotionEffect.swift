//
//  PotionEffect.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol PotionEffect : AnyObject, Tickable, MinecraftIdentifiable {
    var typeID : String { get }
    var hasIcon : Bool { get }
    var hasParticles : Bool { get }
    var isAmbient : Bool { get }
    
    var amplifier : Int { get }
    /// Remaining duration of ticks for this potion effect.
    var duration : Int { get }
}