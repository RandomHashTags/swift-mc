//
//  GameMode.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import SwiftStringCatalogs

public struct GameMode : Identifiable, MultilingualName {
    public let id:String
    public let name:String

    /// The ``InventoryClickType`` ids not allowed for this game mode.
    let disallowedInventoryClickTypes:Set<String>

    public let allowsFlight:Bool

    public let canBreakBlocks:Bool
    public let canBreatheUnderwater:Bool
    public let canPickupItems:Bool
    public let canPlaceBlocks:Bool

    public let isAffectedByGravity:Bool
    public let isDamageable:Bool
    public let isInvisible:Bool
    
    public let losesHunger:Bool
}