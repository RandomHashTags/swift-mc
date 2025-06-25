
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    public struct Disconnect: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id = ClientPacket.Mojang.Java.Configuration.disconnect
        
        /// The reason why the player was disconnected.
        public let reason:ChatPacketMojang

        public init(
            reason: ChatPacketMojang
        ) {
            self.reason = reason
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [reason]
        }
    }
}
