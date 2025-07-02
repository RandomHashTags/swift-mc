
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Used to send a chat message to the server. The message may not be longer than 256 characters or else the server will kick the client.
    ///
    /// The server will broadcast the same chat message to all players on the server (including the player that sent the message), prepended with player's name. Specifically, it will respond with a translate chat component, "chat.type.text" with the first parameter set to the display name of the player (including some chat component logic to support clicking the name to send a PM) and the second parameter set to the message. See [processing chat](https://wiki.vg/Chat#Processing_chat) for more information.
    public struct ChatMessage: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.chatMessage
        
        public let message:String
        public let timestamp:Int64
        /// The salt used to verify the signature hash.
        public let salt:Int64
        public let hasSignature:Bool
        /// The signature used to verify the chat message's authentication. When present, always 256 bytes and not length-prefixed.
        public let signature:[UInt8]?
        public let messageCount:VariableIntegerJava
        public let acknowledged:[UInt8] // TODO: make BitSet
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [
                message,
                timestamp,
                salt,
                hasSignature
            ]
            if hasSignature {
                let signature = try unwrapOptional(signature, key: \Self.signature, precondition: "has_signature == true")
                array.append(contentsOf: signature)
            }
            array.append(messageCount)
            array.append(contentsOf: acknowledged)
            return array
        }
    }
}
