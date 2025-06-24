//
//  Boss.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Boss: Entity {
    var bossBar: (any BossBar)? { get }
}