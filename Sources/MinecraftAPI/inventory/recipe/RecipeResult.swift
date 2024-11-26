//
//  RecipeResult.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol RecipeResult : MinecraftIdentifiable {
    var itemStack : (any ItemStack)? { get }
}
