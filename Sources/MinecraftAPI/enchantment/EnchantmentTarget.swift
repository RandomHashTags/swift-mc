//
//  EnchantmentTarget.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol EnchantmentTarget {
    var materialCategoryIDs: Set<String> { get }
    var materialIDs: Set<String> { get }
}
