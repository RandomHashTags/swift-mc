//
//  ItemMeta.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Foundation

public class ItemMeta : Hashable {
    public static func == (lhs: ItemMeta, rhs: ItemMeta) -> Bool {
        return lhs.display_name == rhs.display_name && lhs.lore == rhs.lore
    }
    
    public var display_name:String?
    public var lore:[String]?
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(display_name)
        hasher.combine(lore)
    }
    
    public init(display_name: String? = nil, lore: [String]? = nil) {
        self.display_name = display_name
        self.lore = lore
    }
}
