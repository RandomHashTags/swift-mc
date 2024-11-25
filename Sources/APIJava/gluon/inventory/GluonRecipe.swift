//
//  GluonRecipe.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

struct GluonRecipe : Recipe {
    var ingredients:[UInt:Set<String>]
    var result_id:String
    var result : (any RecipeResult)? { // TODO: fix
        return nil
    }
}
