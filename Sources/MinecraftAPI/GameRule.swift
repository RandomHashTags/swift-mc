//
//  GameRule.swift
//  
//
//  Created by Evan Anderson on 2/4/23.
//

public protocol GameRule : Hashable, MinecraftIdentifiable {
    var value : ValueType { get }
}