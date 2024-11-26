//
//  MaterialItemConsumableConfiguration.swift
//  
//
//  Created by Evan Anderson on 3/5/23.
//

public protocol MaterialItemConsumableConfiguration : AnyObject, ServerTickChangeListener, MinecraftIdentifiable {
    /// Amount of ticks required of consuming to consider this item to be consumed.
    var duration : UInt64 { get }
    
    var nutrition : Int { get }
    var saturationModifier : Float { get }
    var effects : [any PotionEffect] { get }
}