import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// When a player selects a specific trade offered by a villager NPC.
    struct SelectTrade: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.selectTrade
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let selected_slot:VariableIntegerJava = try packet.readVarInt()
            return Self(selected_slot: selected_slot)
        }
        
        /// The selected slot in the players current (trading) inventory. (Was a full Integer for the plugin message).
        public let selected_slot:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [selected_slot]
        }
    }
}
