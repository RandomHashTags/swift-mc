//
//  EnchantmentTarget.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol EnchantmentTarget : Hashable {
    var material_ids : Set<String> { get }
    var materials : [Material] { get }
}
