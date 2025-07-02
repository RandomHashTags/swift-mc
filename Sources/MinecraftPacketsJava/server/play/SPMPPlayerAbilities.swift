
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// The vanilla client sends this packet when the player starts/stops flying with the Flags parameter changed accordingly.
    public struct PlayerAbilities: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.playerAbilities

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let flags = try packet.readByte()
            return Self(flags: flags)
        }
        
        /// Bit mask. 0x02: is flying.
        public let flags:Int8

        public init(
            flags: Int8
        ) {
            self.flags = flags
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [flags]
        }
    }
}
