//
//  SPMPMessageAcknowledgment.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    struct MessageAcknowledgment: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.messageAcknowledgement
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let message_count:VariableIntegerJava = try packet.readVarInt()
            return Self(message_count: message_count)
        }
        
        public let message_count:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [message_count]
        }
    }
}
