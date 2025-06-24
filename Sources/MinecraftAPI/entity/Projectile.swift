//
//  Projectile.swift
//  
//
//  Created by Evan Anderson on 2/11/23.
//

public protocol Projectile: Entity {
    var source: ProjectileSource? { get }
    mutating func tickProjectile(_ server: any Server)
}