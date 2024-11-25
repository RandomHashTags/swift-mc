//
//  PacketDecodableMojangJava.swift
//  
//
//  Created by Evan Anderson on 8/7/23.
//

import Packets

public protocol PacketDecodableMojangJava : PacketDecodable {
    func packetBytes() throws -> [UInt8]
}
