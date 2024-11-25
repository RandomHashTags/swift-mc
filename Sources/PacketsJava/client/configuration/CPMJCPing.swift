//
//  CPMJCPing.swift
//
//
//  Created by Evan Anderson on 11/15/23.
//

import Packets

extension ClientPacket.Mojang.Java.Configuration {
    /// Packet is not used by the Notchian server. When sent to the client, client responds with a [Pong](https://wiki.vg/Protocol#Pong_.28configuration.29) packet with the same id.
    struct Ping : ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id:ClientPacket.Mojang.Java.Configuration = ClientPacket.Mojang.Java.Configuration.ping
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let id:Int32 = try packet.readInt()
            return Self(id: id)
        }
        
        public let id:Int32
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [id]
        }
    }
}
