//
//  RecipeResult.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol RecipeResult : Identifiable where ID == String {
    var material : (Material)? { get }
    var item_stack : (ItemStack)? { get }
}
