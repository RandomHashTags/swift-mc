import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Applies a cooldown period to all items with the given type. Used by the Notchian server with enderpearls. This packet should be sent when the cooldown starts and also when the cooldown ends (to compensate for lag), although the client will end the cooldown automatically. Can be applied to any item.
    /// > Note: Interactions still get sent to the server with the item but the client does not play the animation nor attempt to predict results (i.e block placing).
    struct SetCooldown: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setCooldown
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let item_id:VariableIntegerJava = try packet.readVarInt()
            let cooldown_ticks:VariableIntegerJava = try packet.readVarInt()
            return Self(item_id: item_id, cooldown_ticks: cooldown_ticks)
        }
        /// Numeric ID of the item to apply a cooldown to.
        public let item_id:VariableIntegerJava
        /// Number of ticks to apply a cooldown for, or 0 to clear the cooldown.
        public let cooldown_ticks:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [item_id, cooldown_ticks]
        }
    }
}
