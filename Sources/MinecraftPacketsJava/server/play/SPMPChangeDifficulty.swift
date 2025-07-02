
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Must have at least op level 2 to use. Appears to only be used on singleplayer; the difficulty buttons are still disabled in multiplayer.
    public struct ChangeDifficulty: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.changeDifficulty
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let newDifficulty = try packet.readByte()
            return Self(newDifficulty: newDifficulty)
        }
        
        /// 0: peaceful, 1: easy, 2: normal, 3: hard .
        public let newDifficulty:Int8
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [newDifficulty]
        }
    }
}
