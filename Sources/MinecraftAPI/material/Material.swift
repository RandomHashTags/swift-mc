//
//  Material.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol Material : Hashable, Identifiable, Nameable where ID == String {
    var categories : [any MaterialCategory] { get }
    var configuration : any MaterialConfiguration { get }

    /// The `Recipe` id this material can be crafted by, if applicable.
    var recipeID : String? { get }
    
    var recipe : (any Recipe)? { get }
}