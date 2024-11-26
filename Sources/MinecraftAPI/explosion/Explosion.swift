//
//  Explosion.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol Explosion : Hashable, MinecraftIdentifiable {
    var location : any Location { get }
    var effect : any ExplosionEffect { get }
    
    var radius : Float { get }
}