
import MinecraftPackets

extension ServerPacket.Mojang.Java.Login {
    /// Acknowledgement to the [Login Success](https://wiki.vg/Protocol#Login_Success) packet sent by the server.
    ///
    /// This packet switches the connection state to [configuration](https://wiki.vg/Protocol#Configuration).
    public struct LoginAcknowledged: ServerPacketMojangJavaLoginProtocol {
        public static let id = ServerPacket.Mojang.Java.Login.loginAcknowledged

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            return Self()
        }

        public init() {
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return []
        }
    }
}
