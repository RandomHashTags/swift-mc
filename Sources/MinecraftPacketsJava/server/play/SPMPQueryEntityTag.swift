
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Used when F3+I is pressed while looking at an entity.
    public struct QueryEntityTag: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.queryEntityTag

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let transactionID:VariableIntegerJava = try packet.readVarInt()
            let entityID:VariableIntegerJava = try packet.readVarInt()
            return Self(transactionID: transactionID, entityID: entityID)
        }
        
        /// An incremental ID so that the client can verify that the response matches.
        public let transactionID:VariableIntegerJava

        /// The ID of the entity to query.
        public let entityID:VariableIntegerJava

        public init(
            transactionID: VariableIntegerJava,
            entityID: VariableIntegerJava
        ) {
            self.transactionID = transactionID
            self.entityID = entityID
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [transactionID, entityID]
        }
    }
}
