
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Sent by the integrated singleplayer server when changing render distance. This packet is sent by the server when the client reappears in the overworld after leaving the end.
    public struct SetRenderDistance: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setRenderDistance

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let viewDistance:VariableIntegerJava = try packet.readVarInt()
            return Self(viewDistance: viewDistance)
        }
        
        /// Render distance (2-32).
        public let viewDistance:VariableIntegerJava

        public init(
            viewDistance: VariableIntegerJava
        ) {
            self.viewDistance = viewDistance
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [viewDistance]
        }
    }
}
