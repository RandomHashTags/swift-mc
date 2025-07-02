
import MinecraftPackets

extension ServerPacket.Mojang.Java.Status {
    /// The status can only be requested once immediately after the handshake, before any ping. The server won't respond otherwise.
    public struct StatusRequest: ServerPacketMojangJavaStatusProtocol {
        public static let id = ServerPacket.Mojang.Java.Status.statusRequest

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
