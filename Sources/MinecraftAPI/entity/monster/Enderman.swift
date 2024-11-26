//
//  Enderman.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Enderman : Monster {
    // TODO: add carried variables
    func teleport() -> Bool
    func teleportTowards(entity: any Entity) -> Bool
}