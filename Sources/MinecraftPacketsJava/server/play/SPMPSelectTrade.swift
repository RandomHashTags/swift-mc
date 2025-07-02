
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// When a player selects a specific trade offered by a villager NPC.
    public struct SelectTrade: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.selectTrade

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let selectedSlot:VariableIntegerJava = try packet.readVarInt()
            return Self(selectedSlot: selectedSlot)
        }
        
        /// The selected slot in the players current (trading) inventory. (Was a full Integer for the plugin message).
        public let selectedSlot:VariableIntegerJava

        public init(
            selectedSlot: VariableIntegerJava
        ) {
            self.selectedSlot = selectedSlot
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [selectedSlot]
        }
    }
}
