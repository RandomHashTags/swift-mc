//
//  SPMPKeepAlive.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import Packets

extension ServerPacket.Mojang.Java.Play {
    /// The server will frequently send out a keep-alive (see [Clientbound Keep Alive](https://wiki.vg/Protocol#Keep_Alive )), each containing a random ID. The client must respond with the same packet.
    struct KeepAlive : ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.keep_alive
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let keep_alive_id:Int64 = try packet.readLong()
            return Self(keep_alive_id: keep_alive_id)
        }
        
        public let keep_alive_id:Int64
        
        public func encoded_values() throws -> [(any PacketEncodableMojangJava)?] {
            return [keep_alive_id]
        }
    }
}
