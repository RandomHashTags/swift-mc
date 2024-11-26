//
//  Recipe.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol Recipe : Hashable, Identifiable where ID == String {
    /// The slot and `Material` identifiers required to craft the result.
    var ingredients : [UInt:Set<String>] { get }

    /// The `RecipeResult` crafted by this recipe.
    var result : (any RecipeResult)? { get }
}