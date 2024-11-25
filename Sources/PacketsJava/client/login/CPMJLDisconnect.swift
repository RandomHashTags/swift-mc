//
//  CPMJLDisconnect.swift
//
//
//  Created by Evan Anderson on 8/3/23.
//

import Packets

extension ClientPacket.Mojang.Java.Login {
    struct Disconnect : ClientPacketMojangJavaLoginProtocol {
        public static let id:ClientPacket.Mojang.Java.Login = ClientPacket.Mojang.Java.Login.disconnect
        
        /// The reason why the player was disconnected.
        public let reason:ChatPacketMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [reason]
        }
    }
}
