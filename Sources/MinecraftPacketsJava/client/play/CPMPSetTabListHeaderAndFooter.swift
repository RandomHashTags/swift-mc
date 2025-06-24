import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// This packet may be used by custom servers to display additional information above/below the player list. It is never sent by the Notchian server.
    struct SetTabListHeaderAndFooter: ClientPacket.Mojang.Java.PlayProtocol { // TODO: fix (parse)
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setTabListHeaderAndFooter
        
        /// To remove the header, send a empty text component: `{"text":""}`.
        public let header:ChatPacketMojang
        /// To remove the header, send a empty text component: `{"text":""}`.
        public let footer:ChatPacketMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [header, footer]
        }
    }
}
