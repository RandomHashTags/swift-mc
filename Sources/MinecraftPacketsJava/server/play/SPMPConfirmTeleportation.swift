
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent by client as confirmation of [Synchronize Player Position](https://wiki.vg/Protocol#Synchronize_Player_Position ).
    public struct ConfirmTeleportation: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.confirmTeleportation
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let teleportID:VariableIntegerJava = try packet.readVarInt()
            return Self(teleportID: teleportID)
        }

        /*static func serverReceived(_ client: MinecraftClientHandler) throws {
            let packet:Self = try client.read_and_parse_mojang_packet()
        }*/
        
        /// The ID given by the [Synchronize Player Position](https://wiki.vg/Protocol#Synchronize_Player_Position) packet.
        public let teleportID:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [teleportID]
        }
    }
}
