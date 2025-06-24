//
//  Warden.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Warden: Monster {
    var anger: Int { get }
    var angryAt: (any LivingEntity)? { get }
    var angerLevel: any WardenAngerLevel { get }
}