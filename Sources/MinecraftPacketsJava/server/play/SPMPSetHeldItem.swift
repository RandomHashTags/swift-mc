
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when the player changes the slot selection.
    public struct SetHeldItem: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.setHeldItem

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let slot = try packet.readShort()
            return Self(slot: slot)
        }
        
        /// The slot which the player has selected (0–8).
        public let slot:Int16

        public init(
            slot: Int16
        ) {
            self.slot = slot
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [slot]
        }
    }
}
