//
//  PacketDecodableMojangJava.swift
//  
//
//  Created by Evan Anderson on 8/7/23.
//

import MinecraftPackets

public protocol PacketDecodableMojangJava: PacketDecodable {
    func packetBytes() throws -> [UInt8]
}
