
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// The server will frequently send out a keep-alive (see [Clientbound Keep Alive](https://wiki.vg/Protocol#Keep_Alive )), each containing a random ID. The client must respond with the same packet.
    public struct KeepAlive: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.keepAlive
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let keepAliveID = try packet.readLong()
            return Self(keepAliveID: keepAliveID)
        }
        
        public let keepAliveID:Int64
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [keepAliveID]
        }
    }
}
