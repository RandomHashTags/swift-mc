import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Tells the client to unload a chunk column.
    ///
    /// It is legal to send this packet even if the given chunk is not currently loaded.
    struct UnloadChunk: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.unloadChunk
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let chunk_x:Int32 = try packet.readInt()
            let chunk_z:Int32 = try packet.readInt()
            return Self(chunk_x: chunk_x, chunk_z: chunk_z)
        }
        
        /// Block coordinate divided by 16, rounded down.
        public let chunk_x:Int32
        /// Block coordinate divided by 16, rounded down.
        public let chunk_z:Int32
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [chunk_x, chunk_z]
        }
    }
}
