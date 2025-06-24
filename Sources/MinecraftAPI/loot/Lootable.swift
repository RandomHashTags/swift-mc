//
//  Lootable.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Lootable {
    var seed: Int { get }
    var lootTable: (any LootTable)? { get }
}