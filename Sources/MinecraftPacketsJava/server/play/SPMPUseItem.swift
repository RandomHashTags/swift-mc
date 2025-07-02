
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when pressing the Use Item key (default: right click) with an item in hand.
    public struct UseItem: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.useItem

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let hand:Hand = try packet.readEnum()
            let sequence:VariableIntegerJava = try packet.readVarInt()
            return Self(hand: hand, sequence: sequence)
        }
        
        public let hand:Hand
        public let sequence:VariableIntegerJava

        public init(
            hand: Hand,
            sequence: VariableIntegerJava
        ) {
            self.hand = hand
            self.sequence = sequence
        }
        
        public enum Hand: Int, Codable, PacketEncodableMojangJava {
            case mainHand
            case offHand
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [hand, sequence]
        }
    }
}
