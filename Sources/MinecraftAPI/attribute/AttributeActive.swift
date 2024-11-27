//
//  AttributeActive.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol AttributeActive : MinecraftIdentifiable {
    var attribute : (any Attribute)? { get }
    
    var baseValue : Double { get }
    var defaultValue : Double { get }
    var value : Double { get }

    var modifiers : [any AttributeModifier] { get } // TODO: make Set
}
