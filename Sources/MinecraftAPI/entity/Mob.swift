//
//  Mob.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Mob : LivingEntity, Lootable {
    var isAware : Bool { get }
    var soundAmbient : (any Sound)? { get }
    var target : (any LivingEntity)? { get }
}