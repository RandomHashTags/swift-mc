//
//  Shulker.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Shulker: Colorable, Golem, Hostile {
    var peeking: Float { get }
    var attachedFace: any BlockFace { get }
}