
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// !
    ///
    /// Also known as 'Input' packet.
    public struct PlayerInput: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.playerInput

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let sideways = try packet.readFloat()
            let forward = try packet.readFloat()
            let flags = try packet.readUnsignedByte()
            return Self(sideways: sideways, forward: forward, flags: flags)
        }
        
        /// Positive to the left of the player.
        public let sideways:Float

        /// Positive forward.
        public let forward:Float

        /// Bit mask. 0x1: jump, 0x2: unmount.
        public let flags:UInt8

        public init(
            sideways: Float,
            forward: Float,
            flags: UInt8
        ) {
            self.sideways = sideways
            self.forward = forward
            self.flags = flags
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [sideways, forward, flags]
        }
    }
}
