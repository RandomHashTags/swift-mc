
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Sent to change the player's slot selection.
    public struct SetHeldItem: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setHeldItem

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let slot = try packet.readByte()
            return Self(slot: slot)
        }
        
        /// The slot which the player has selected (0–8).
        public let slot:Int8

        public init(
            slot: Int8
        ) {
            self.slot = slot
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [slot]
        }
    }
}
