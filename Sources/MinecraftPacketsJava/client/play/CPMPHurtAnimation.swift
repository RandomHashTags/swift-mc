import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Plays a bobbing animation for the entity receiving damage.
    struct HurtAnimation: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.hurtAnimation
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let yaw:Float = try packet.readFloat()
            return Self(entityID: entityID, yaw: yaw)
        }
        
        /// The ID of the entity taking damage
        public let entityID:VariableIntegerJava
        /// The direction the damage is coming from in relation to the entity
        public let yaw:Float
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [entityID, yaw]
        }
    }
}
