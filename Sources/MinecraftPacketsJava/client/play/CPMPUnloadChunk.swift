
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Tells the client to unload a chunk column.
    ///
    /// It is legal to send this packet even if the given chunk is not currently loaded.
    public struct UnloadChunk: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.unloadChunk

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let chunkX = try packet.readInt()
            let chunkZ = try packet.readInt()
            return Self(chunkX: chunkX, chunkZ: chunkZ)
        }
        
        /// Block coordinate divided by 16, rounded down.
        public let chunkX:Int32

        /// Block coordinate divided by 16, rounded down.
        public let chunkZ:Int32

        public init(
            chunkX: Int32,
            chunkZ: Int32
        ) {
            self.chunkX = chunkX
            self.chunkZ = chunkX
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [chunkX, chunkZ]
        }
    }
}
