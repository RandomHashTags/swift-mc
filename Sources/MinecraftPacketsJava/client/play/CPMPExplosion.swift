
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Sent when an explosion occurs (creepers, TNT, and ghast fireballs).
    ///
    /// Each block in Records is set to air. Coordinates for each axis in record is int(X) + record.x
    public struct Explosion: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.explosion
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let x = try packet.readDouble()
            let y = try packet.readDouble()
            let z = try packet.readDouble()
            let strength = try packet.readFloat()
            let recordCount:VariableIntegerJava = try packet.readVarInt()
            let data:Data = try packet.readData(bytes: recordCount.valueInt * 3)
            let playerMotionX = try packet.readFloat()
            let playerMotionY = try packet.readFloat()
            let playerMotionZ = try packet.readFloat()
            return Self(x: x, y: y, z: z, strength: strength, recordCount: recordCount, records: data, playerMotionX: playerMotionX, playerMotionY: playerMotionY, playerMotionZ: playerMotionZ)
        }
        
        public let x:Double
        public let y:Double
        public let z:Double
        /// A strength greater than or equal to 2.0 spawns a `minecraft:explosion_emitter` particle, while a lesser strength spawns a `minecraft:explosion` particle.
        public let strength:Float
        /// Number of elements in `records`.
        public let recordCount:VariableIntegerJava
        /// as! [(Int8, Int8, Int8)]
        /// Each record is 3 signed bytes long; the 3 bytes are the XYZ (respectively) signed offsets of affected blocks.
        public let records:Data // TODO: make [(Int8, Int8, Int8)]
        /// X velocity of the player being pushed by the explosion.
        public let playerMotionX:Float
        /// Y velocity of the player being pushed by the explosion.
        public let playerMotionY:Float
        /// Z velocity of the player being pushed by the explosion.
        public let playerMotionZ:Float

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                x,
                y,
                z,
                strength,
                recordCount,
                records,
                playerMotionX,
                playerMotionY,
                playerMotionZ
            ]
        }
    }
}
