//
//  SPMPProgramCommandBlockMinecart.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    struct ProgramCommandBlockMinecart: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.programCommandBlockMinecart
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let command:String = try packet.readString()
            let track_output:Bool = try packet.readBool()
            return Self(entityID: entityID, command: command, track_output: track_output)
        }
        
        public let entityID:VariableIntegerJava
        public let command:String
        public let track_output:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [entityID, command, track_output]
        }
    }
}
