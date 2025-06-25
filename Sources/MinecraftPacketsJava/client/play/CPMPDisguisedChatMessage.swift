import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Used to send system chat messages to the client.
    struct DisguisedChatMessage: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.disguisedChatMessage
        
        public let message:ChatPacketMojang
        /// The chat message type.
        public let chatType:VariableIntegerJava
        /// The name associated with the chat type. Usually the message sender's display name.
        public let chatType_name:ChatPacketMojang
        /// True if target name is present.
        public let has_target_name:Bool
        /// The target name associated with the chat type. Usually the message target's display name. Only present if previous boolean is true.
        public let target_name:ChatPacketMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                message,
                chatType,
                chatType_name,
                has_target_name,
                target_name
            ]
        }
    }
}
