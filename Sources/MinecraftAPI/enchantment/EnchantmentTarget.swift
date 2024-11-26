//
//  EnchantmentTarget.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol EnchantmentTarget : Hashable {
    var materialIDs : Set<String> { get }
    var materials : [any Material] { get }
}
