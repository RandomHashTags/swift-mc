//
//  Structure.swift
//  
//
//  Created by Evan Anderson on 11/28/24.
//

public protocol Structure: MinecraftIdentifiable {
    var categories: [any StructureCategory] { get } // TODO: make Set
}