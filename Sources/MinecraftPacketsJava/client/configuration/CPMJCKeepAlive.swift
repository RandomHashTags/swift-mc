
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    /// The server will frequently send out a keep-alive, each containing a random ID. The client must respond with the same payload (see [Serverbound Keep Alive](https://wiki.vg/Protocol#Serverbound_Keep_Alive_.28configuration.29 )). If the client does not respond to them for over 30 seconds, the server kicks the client. Vice versa, if the server does not send any keep-alives for 20 seconds, the client will disconnect and yields a "Timed out" exception.
    /// The Notchian server uses a system-dependent time in milliseconds to generate the keep alive ID value.
    public struct KeepAlive: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id = ClientPacket.Mojang.Java.Configuration.keepAlive

        public let keepAliveID:Int64

        public init(
            keepAliveID: Int64
        ) {
            self.keepAliveID = keepAliveID
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [keepAliveID]
        }
    }
}

// MARK: Parse
extension ClientPacket.Mojang.Java.Configuration.KeepAlive {
    @inlinable
    public static func parse(_ packet: any GeneralPacket) throws -> Self {
        let keepAliveID = try packet.readLong()
        return Self(keepAliveID: keepAliveID)
    }
}
