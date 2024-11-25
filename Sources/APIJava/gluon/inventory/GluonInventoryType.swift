//
//  GluonInventoryType.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

struct GluonInventoryType : InventoryType {
    let id:String
    let categories:[String]
    let size:UInt
    let material_category_restrictions:[UInt:Set<String>]?
    let materialRestrictions:[UInt:Set<String>]?
    let allowedRecipeIDs:Set<String>?
    var allowed_recipes : [any Recipe]? {
        guard let identifiers:Set<String> = allowedRecipeIDs else { return nil }
        return GluonServer.shared.get_recipes(identifiers: identifiers)
    }
}
