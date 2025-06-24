//
//  BlockMovable.swift
//  
//
//  Created by Evan Anderson on 11/28/24.
//

public protocol BlockMovable {
    /// The reaction of this type when attempting to be moved by a block.
    var blockMoveReaction: any BlockMoveReaction { get }
}