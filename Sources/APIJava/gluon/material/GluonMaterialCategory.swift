//
//  GluonMaterialCategory.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

struct GluonMaterialCategory : MaterialCategory {
    let id:String
    let configurationID:String
    var configuration : (any MaterialConfiguration)? {
        return nil // TODO: fix
    }
}
