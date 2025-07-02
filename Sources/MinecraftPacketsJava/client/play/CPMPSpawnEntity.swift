
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Sent by the server when a vehicle or other non-living entity is created.
    public struct SpawnEntity: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.spawnEntity
        
        /// A unique integer ID mostly used to identify the entity.
        public let entityID:VariableIntegerJava
        /// A unique identifier that is mostly used in persistence and places where the uniqueness matters more.
        public let entityUUID:UUID
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
        public let headYaw:Float
        public let data:VariableIntegerJava
        public let velocityX:Int
        public let velocityY:Int
        public let velocityZ:Int

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                entityID,
                entityUUID,
                type,
                x,
                y,
                z,
                pitch,
                yaw,
                headYaw,
                data,
                velocityX,
                velocityY,
                velocityZ
            ]
        }
    }
}
