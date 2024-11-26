//
//  CPMPSpawnEntity.swift
//
//
//  Created by Evan Anderson on 8/2/23.
//

import Foundation
import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Sent by the server when a vehicle or other non-living entity is created.
    struct SpawnEntity : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.spawnEntity
        
        /// A unique integer ID mostly used to identify the entity.
        public let entityID:VariableIntegerJava
        /// A unique identifier that is mostly used in persistence and places where the uniqueness matters more.
        public let entity_uuid:UUID
        /// The type of the entity.
        public let type:VariableIntegerJava
        public let x:Double
        public let y:Double
        public let z:Double
        /// To get the real pitch, you must divide this by (256.0F / 360.0F)
        public let pitch:Float
        /// To get the real yaw, you must divide this by (256.0F / 360.0F)
        public let yaw:Float
        /// Only used by living entities, where the head of the entity may differ from the general body rotation.
        public let head_yaw:Float
        public let data:VariableIntegerJava
        public let velocityX:Int
        public let velocityY:Int
        public let velocityZ:Int
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                entityID,
                entity_uuid,
                type,
                x,
                y,
                z,
                pitch,
                yaw,
                head_yaw,
                data,
                velocityX,
                velocityY,
                velocityZ
            ]
        }
    }
}
