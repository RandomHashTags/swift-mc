import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Sent by the integrated singleplayer server when changing render distance. This packet is sent by the server when the client reappears in the overworld after leaving the end.
    struct SetRenderDistance: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setRenderDistance
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let view_distance:VariableIntegerJava = try packet.readVarInt()
            return Self(view_distance: view_distance)
        }
        
        /// Render distance (2-32).
        public let view_distance:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [view_distance]
        }
    }
}
