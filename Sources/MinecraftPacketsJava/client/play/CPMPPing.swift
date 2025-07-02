import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Packet is not used by the Notchian server. When sent to the client, client responds with a Pong packet with the same id.
    struct Ping: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.ping
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let id:Int32 = try packet.readInt()
            return Self(id: id)
        }
        
        /*public static func serverReceived(_ client: any MinecraftClientHandler) throws {
            let packet:Self = try client.read_and_parse_mojang_packet()
            let server_response_packet:ServerPacket.Mojang.Java.Play.Pong = ServerPacket.Mojang.Java.Play.Pong(id: packet.id)
            try client.sendPacket(server_response_packet)
        }*/ // TODO: fix
        
        public let id:Int32
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [id]
        }
    }
}
