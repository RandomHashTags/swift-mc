import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// Used when `F3+I` is pressed while looking at a block.
    struct QueryBlockEntityTag: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.queryBlockEntityTag
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let transactionID:VariableIntegerJava = try packet.readVarInt()
            let position:PositionPacketMojang = try packet.readPacket()
            return Self(transactionID: transactionID, position: position)
        }
        
        /// An incremental ID so that the client can verify that the response matches.
        public let transactionID:VariableIntegerJava
        /// The location of the block to check.
        public let position:PositionPacketMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [transactionID, position]
        }
    }
}
