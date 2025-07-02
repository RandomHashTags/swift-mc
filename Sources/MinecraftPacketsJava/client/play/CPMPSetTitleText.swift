
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetTitleText: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setTitleText
        
        public let text:ChatPacketMojang

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [text]
        }
    }
}
