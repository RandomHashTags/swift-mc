import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// The vanilla client sends this packet when the player starts/stops flying with the Flags parameter changed accordingly.
    struct PlayerAbilities: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.playerAbilities
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let flags:Int8 = try packet.readByte()
            return Self(flags: flags)
        }
        
        /// Bit mask. 0x02: is flying.
        public let flags:Int8
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [flags]
        }
    }
}
