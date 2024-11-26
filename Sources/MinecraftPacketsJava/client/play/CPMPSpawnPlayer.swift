//
//  CPMPSpawnPlayer.swift
//
//
//  Created by Evan Anderson on 8/2/23.
//

import Foundation
import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// This packet is sent by the server when a player comes into visible range, not when a player joins.
    ///
    /// This packet must be sent after the Player Info Update packet that adds the player data for the client to use when spawning a player. If the Player Info for the player spawned by this packet is not present when this packet arrives, Notchian clients will not spawn the player entity. The Player Info packet includes skin/cape data.
    ///
    /// Servers can, however, safely spawn player entities for players not in visible range. The client appears to handle it correctly.
    struct SpawnPlayer : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.spawnPlayer
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let player_uuid:UUID = try packet.readUUID()
            let x:Double = try packet.readDouble()
            let y:Double = try packet.readDouble()
            let z:Double = try packet.readDouble()
            let yaw:AngleMojang = try packet.readAngle()
            let pitch:AngleMojang = try packet.readAngle()
            return Self(entityID: entityID, player_uuid: player_uuid, x: x, y: y, z: z, yaw: yaw, pitch: pitch)
        }
        
        /// A unique integer ID mostly used to identify the player.
        public let entityID:VariableIntegerJava
        public let player_uuid:UUID
        public let x:Double
        public let y:Double
        public let z:Double
        public let yaw:AngleMojang
        public let pitch:AngleMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                entityID,
                player_uuid,
                x,
                y,
                z,
                yaw,
                pitch
            ]
        }
    }
}
