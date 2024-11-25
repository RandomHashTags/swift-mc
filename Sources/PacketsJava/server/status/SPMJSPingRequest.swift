//
//  SPMJSPingRequest.swift
//
//
//  Created by Evan Anderson on 8/4/23.
//

import Packets

extension ServerPacket.Mojang.Java.Status {
    struct PingRequest : ServerPacketMojangJavaStatusProtocol {
        public static let id:ServerPacket.Mojang.Java.Status = ServerPacket.Mojang.Java.Status.pingRequest
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let payload:Int64 = try packet.readLong()
            return Self(payload: payload)
        }
        
        /// May be any number. Notchian clients use a system-dependent time value which is counted in milliseconds.
        public let payload:Int64
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [payload]
        }
    }
}
