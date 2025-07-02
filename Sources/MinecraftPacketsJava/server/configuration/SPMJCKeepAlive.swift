
import MinecraftPackets

extension ServerPacket.Mojang.Java.Configuration {
    /// The server will frequently send out a keep-alive (see [Clientbound Keep Alive](https://wiki.vg/Protocol#Clientbound_Keep_Alive_.28configuration.29 )), each containing a random ID. The client must respond with the same packet.
    public struct KeepAlive: ServerPacketMojangJavaConfigurationProtocol {
        public static let id = ServerPacket.Mojang.Java.Configuration.keepAlive

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let keepAliveId = try packet.readLong()
            return Self(keepAliveId: keepAliveId)
        }
        
        public let keepAliveId:Int64

        public init(
            keepAliveId: Int64
        ) {
            self.keepAliveId = keepAliveId
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [keepAliveId]
        }
    }
}
