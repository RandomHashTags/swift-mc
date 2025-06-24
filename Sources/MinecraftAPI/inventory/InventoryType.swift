//
//  InventoryType.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol InventoryType: MinecraftIdentifiable {
    var categories: [String] { get }
    /// Maximum amount of slots this inventory type contains.
    var size: Int { get }
    /// Whitelisted slots where specific `MaterialCategory` ids can only be placed at, if applicable.
    var material_category_restrictions: [Int:Set<String>]? { get }
    /// Whitelisted slots where specific `Material` ids can only be placed at, if applicable.
    var materialRestrictions: [Int:Set<String>]? { get }
    /// The allowed `Recipe`s that can be created when inside this inventory type, if applicable.
    var allowed_recipes: [any Recipe]? { get }
}