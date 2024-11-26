//
//  SPMPPlayerInput.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// !
    ///
    /// Also known as 'Input' packet.
    struct PlayerInput : ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.playerInput
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let sideways:Float = try packet.readFloat()
            let forward:Float = try packet.readFloat()
            let flags:UInt8 = try packet.readUnsignedByte()
            return Self(sideways: sideways, forward: forward, flags: flags)
        }
        
        /// Positive to the left of the player.
        public let sideways:Float
        /// Positive forward.
        public let forward:Float
        /// Bit mask. 0x1: jump, 0x2: unmount.
        public let flags:UInt8
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [sideways, forward, flags]
        }
    }
}
