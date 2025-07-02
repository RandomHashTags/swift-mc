import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct CommandSuggestionsRequest: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.commandSuggestionsRequest
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let transactionID:VariableIntegerJava = try packet.readVarInt()
            let text = try packet.readString()
            return Self(transactionID: transactionID, text: text)
        }
        
        /// The id of the transaction that the server will send back to the client in the response of this packet. Client generates this and increments it each time it sends another tab completion that doesn't get a response.
        public let transactionID:VariableIntegerJava

        /// All text behind the cursor without the `/` (e.g. to the left of the cursor in left-to-right languages like English).
        public let text:String
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [transactionID, text]
        }
    }
}
