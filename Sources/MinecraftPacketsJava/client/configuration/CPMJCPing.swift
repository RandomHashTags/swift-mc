
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    /// Packet is not used by the Notchian server. When sent to the client, client responds with a [Pong](https://wiki.vg/Protocol#Pong_.28configuration.29) packet with the same id.
    public struct Ping: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id = ClientPacket.Mojang.Java.Configuration.ping
        
        public let id:Int32

        @inlinable
        public init(
            id: Int32
        ) {
            self.id = id
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [id]
        }
    }
}

// MARK: Parse
extension ClientPacket.Mojang.Java.Configuration.Ping {
    @inlinable
    public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
        let id = try packet.readInt()
        return Self(id: id)
    }
}