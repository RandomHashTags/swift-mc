//
//  AngleMojang.swift
//  
//
//  Created by Evan Anderson on 8/6/23.
//

import MinecraftPackets

/// A rotation angle in steps of 1/256 of a full turn
public struct AngleMojang: Angle, PacketEncodableMojangJava {
    /// Whether or not this is signed does not matter, since the resulting angles are the same.
    public let value:Int
}
