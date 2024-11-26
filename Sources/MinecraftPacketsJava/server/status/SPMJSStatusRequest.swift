//
//  SPMJSStatusRequest.swift
//
//
//  Created by Evan Anderson on 8/4/23.
//

import MinecraftPackets

extension ServerPacket.Mojang.Java.Status {
    /// The status can only be requested once immediately after the handshake, before any ping. The server won't respond otherwise.
    struct StatusRequest : ServerPacketMojangJavaStatusProtocol {
        public static let id:ServerPacket.Mojang.Java.Status = ServerPacket.Mojang.Java.Status.statusRequest
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            return StatusRequest()
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return []
        }
    }
}
