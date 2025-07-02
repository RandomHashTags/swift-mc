
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Plays a bobbing animation for the entity receiving damage.
    public struct HurtAnimation: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.hurtAnimation

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let yaw = try packet.readFloat()
            return Self(entityID: entityID, yaw: yaw)
        }
        
        /// The ID of the entity taking damage
        public let entityID:VariableIntegerJava

        /// The direction the damage is coming from in relation to the entity
        public let yaw:Float

        public init(
            entityID: VariableIntegerJava,
            yaw: Float
        ) {
            self.entityID = entityID
            self.yaw = yaw
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [entityID, yaw]
        }
    }
}
