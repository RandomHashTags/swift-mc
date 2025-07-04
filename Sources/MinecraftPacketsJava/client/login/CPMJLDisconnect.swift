
import MinecraftPackets

extension ClientPacket.Mojang.Java.Login {
    public struct Disconnect: ClientPacketMojangJavaLoginProtocol {
        public static let id:ClientPacket.Mojang.Java.Login = ClientPacket.Mojang.Java.Login.disconnect
        
        /// The reason why the player was disconnected.
        public let reason:ChatPacketMojang

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [reason]
        }
    }
}
