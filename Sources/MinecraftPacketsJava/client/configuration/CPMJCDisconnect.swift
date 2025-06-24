
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    struct Disconnect: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id:ClientPacket.Mojang.Java.Configuration = ClientPacket.Mojang.Java.Configuration.disconnect
        
        /// The reason why the player was disconnected.
        public let reason:ChatPacketMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [reason]
        }
    }
}
