//
//  BlockData.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol BlockData {
    var lightLevel : Int { get }
    var isOccluding : Bool { get }
    var mapColor : Color { get }
    var moveReaction : (any BlockMoveReaction)? { get }
    var requiresCorrectToolForDrops : Bool { get }
}