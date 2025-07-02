import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct SetSimulationDistance: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setSimulationDistance
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let distance:VariableIntegerJava = try packet.readVarInt()
            return Self(distance: distance)
        }
        
        /// The distance that the client will process specific things, such as entities.
        public let distance:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [distance]
        }
    }
}
