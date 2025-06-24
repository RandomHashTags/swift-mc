import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct SetTitleText: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setTitleText
        
        public let text:ChatPacketMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [text]
        }
    }
}
