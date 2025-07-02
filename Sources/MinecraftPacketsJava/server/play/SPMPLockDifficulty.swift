
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Must have at least op level 2 to use. Appears to only be used on singleplayer; the difficulty buttons are still disabled in multiplayer.
    public struct LockDifficulty: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.lockDifficulty

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let locked = try packet.readBool()
            return Self(locked: locked)
        }
        
        public let locked:Bool

        public init(
            locked: Bool
        ) {
            self.locked = locked
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [locked]
        }
    }
}
