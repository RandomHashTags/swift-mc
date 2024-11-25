//
//  PacketDecodable.swift
//
//
//  Created by Evan Anderson on 8/6/23.
//

public protocol PacketDecodable : Hashable {
    static func decode(from packet: any GeneralPacket) throws -> Self
    func packetBytes() throws -> [UInt8]
}