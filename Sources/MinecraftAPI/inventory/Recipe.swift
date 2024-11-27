//
//  Recipe.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol Recipe : MinecraftIdentifiable {
    /// The `ItemStack` crafted by this recipe.
    var result : any ItemStack { get }
}