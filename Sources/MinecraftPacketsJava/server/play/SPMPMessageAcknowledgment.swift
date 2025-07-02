
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct MessageAcknowledgment: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.messageAcknowledgement

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let messageCount:VariableIntegerJava = try packet.readVarInt()
            return Self(messageCount: messageCount)
        }
        
        public let messageCount:VariableIntegerJava

        public init(
            messageCount: VariableIntegerJava
        ) {
            self.messageCount = messageCount
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [messageCount]
        }
    }
}
