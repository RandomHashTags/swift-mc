//
//  Attribute.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Attribute : Nameable, MinecraftIdentifiable {
    var baseValue : Double { get }
    var description : String { get }
}
