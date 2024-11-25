//
//  GluonItemMeta.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

struct GluonItemMeta : ItemMeta {
    var displayName:String?
    var lore:[String]?
    var flags:[any ItemFlag]?
    var enchants:[String:Int]?
}
