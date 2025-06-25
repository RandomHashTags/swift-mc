
import MinecraftPackets

extension ClientPacket.Mojang.Java.Login {
    /// Used to implement a custom handshaking flow together with Login Plugin Response.
    ///
    /// Unlike plugin messages in "play" mode, these messages follow a lock-step request/response scheme, where the client is expected to respond to a request indicating whether it understood. The notchian client always responds that it hasn't understood, and sends an empty payload.
    ///
    /// In Notchian client, the maximum data length is 1048576 bytes.
    public struct LoginPluginRequest: ClientPacketMojangJavaLoginProtocol {
        public static let id = ClientPacket.Mojang.Java.Login.loginPluginRequest

        @inlinable
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let messageID:VariableIntegerJava = try packet.readVarInt()
            let channel:NamespaceJava = try packet.readIdentifier()
            let data:[UInt8] = try packet.readRemainingByteArray()
            return Self(messageID: messageID, channel: channel, data: data)
        }
        
        public let messageID:VariableIntegerJava
        public let channel:NamespaceJava
        public let data:[UInt8]

        public init(
            messageID: VariableIntegerJava,
            channel: NamespaceJava,
            data: [UInt8]
        ) {
            self.messageID = messageID
            self.channel = channel
            self.data = data
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [messageID, channel]
            array.append(contentsOf: data)
            return array
        }
    }
}
