//
//  SPMJLLoginAcknowledged.swift
//
//
//  Created by Evan Anderson on 11/6/23.
//

import MinecraftPackets

extension ServerPacket.Mojang.Java.Login {
    /// Acknowledgement to the [Login Success](https://wiki.vg/Protocol#Login_Success) packet sent by the server.
    ///
    /// This packet switches the connection state to [configuration](https://wiki.vg/Protocol#Configuration).
    struct LoginAcknowledged: ServerPacketMojangJavaLoginProtocol {
        public static let id:ServerPacket.Mojang.Java.Login = ServerPacket.Mojang.Java.Login.loginAcknowledged
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            return Self()
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return []
        }
    }
}
