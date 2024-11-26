//
//  EnchantmentTarget.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol EnchantmentTarget : Hashable {
    var materialCategoryIDs : Set<String> { get }
    var materialIDs : Set<String> { get }
}
