
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when the player's arm swings.
    public struct SwingArm: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.swingArm

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let hand:Hand = try packet.readEnum()
            return Self(hand: hand)
        }
        
        public let hand:Hand

        public init(
            hand: Hand
        ) {
            self.hand = hand
        }
        
        public enum Hand: Int, Codable, PacketEncodableMojangJava {
            case mainHand
            case offHand
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [hand]
        }
    }
}
