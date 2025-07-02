
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Used to send system chat messages to the client.
    public struct DisguisedChatMessage: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.disguisedChatMessage
        
        public let message:ChatPacketMojang
        /// The chat message type.
        public let chatType:VariableIntegerJava
        /// The name associated with the chat type. Usually the message sender's display name.
        public let chatTypeName:ChatPacketMojang
        /// True if target name is present.
        public let hasTargetName:Bool
        /// The target name associated with the chat type. Usually the message target's display name. Only present if previous boolean is true.
        public let targetName:ChatPacketMojang

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                message,
                chatType,
                chatTypeName,
                hasTargetName,
                targetName
            ]
        }
    }
}
