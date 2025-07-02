
import MinecraftPackets

extension ServerPacket.Mojang.Java.Login {
    /// In Notchian server, the maximum data length is 1048576 bytes.
    public struct LoginPluginResponse: ServerPacketMojangJavaLoginProtocol {
        public static let id = ServerPacket.Mojang.Java.Login.loginPluginResponse

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let messageID:VariableIntegerJava = try packet.readVarInt()
            let successful = try packet.readBool()
            let data = try packet.readRemainingOptionalByteArray()
            return Self(messageID: messageID, successful: successful, data: data)
        }
        
        /// Should match ID from server.
        public let messageID:VariableIntegerJava
    
        /// `true` if the client understood the request, `false` otherwise. When `false`, no payload follows.
        public let successful:Bool

        /// Any data, depending on the channel. The length of this array must be inferred from the packet length.
        public let data:[UInt8]?

        public init(
            messageID: VariableIntegerJava,
            successful: Bool,
            data: [UInt8]?
        ) {
            self.messageID = messageID
            self.successful = successful
            self.data = data
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var values:[any PacketEncodableMojangJava] = [messageID, successful]
            if let data:[UInt8] = data {
                values.append(contentsOf: data)
            }
            return values
        }
    }
}
