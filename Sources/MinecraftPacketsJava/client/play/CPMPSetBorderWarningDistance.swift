//
//  CPMPSetBorderWarningDistance.swift
//  
//
//  Created by Evan Anderson on 8/8/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct SetBorderWarningDistance: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setBorderWarningDistance
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let warningBlocks:VariableIntegerJava = try packet.readVarInt()
            return Self(warningBlocks: warningBlocks)
        }
        
        /// In meters.
        public let warningBlocks:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [warningBlocks]
        }
    }
}
