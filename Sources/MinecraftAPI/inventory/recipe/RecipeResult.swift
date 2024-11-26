//
//  RecipeResult.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol RecipeResult : Identifiable {
    var itemStack : (any ItemStack)? { get }
}
