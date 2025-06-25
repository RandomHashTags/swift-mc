import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetSubtitleText: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setSubtitleText
        
        public let text:ChatPacketMojang

        public init(
            text: ChatPacketMojang
        ) {
            self.text = text
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [text]
        }
    }
}
