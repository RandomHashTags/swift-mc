import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Velocity is in units of 1/8000 of a block per server tick (50ms); for example, -1343 would move (-1343 / 8000) = −0.167875 blocks per tick (or −3.3575 blocks per second).
    struct SetEntityVelocity: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setEntityVelocity
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let velocityX:Int16 = try packet.readShort()
            let velocityY:Int16 = try packet.readShort()
            let velocityZ:Int16 = try packet.readShort()
            return Self(entityID: entityID, velocityX: velocityX, velocityY: velocityY, velocityZ: velocityZ)
        }
        
        public let entityID:VariableIntegerJava
        public let velocityX:Int16
        public let velocityY:Int16
        public let velocityZ:Int16
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                entityID,
                velocityX,
                velocityY,
                velocityZ
            ]
        }
    }
}
