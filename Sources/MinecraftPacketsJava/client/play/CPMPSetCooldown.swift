
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Applies a cooldown period to all items with the given type. Used by the Notchian server with enderpearls. This packet should be sent when the cooldown starts and also when the cooldown ends (to compensate for lag), although the client will end the cooldown automatically. Can be applied to any item.
    /// > Note: Interactions still get sent to the server with the item but the client does not play the animation nor attempt to predict results (i.e block placing).
    public struct SetCooldown: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setCooldown

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let itemID:VariableIntegerJava = try packet.readVarInt()
            let cooldownTicks:VariableIntegerJava = try packet.readVarInt()
            return Self(itemID: itemID, cooldownTicks: cooldownTicks)
        }
        /// Numeric ID of the item to apply a cooldown to.
        public let itemID:VariableIntegerJava

        /// Number of ticks to apply a cooldown for, or 0 to clear the cooldown.
        public let cooldownTicks:VariableIntegerJava

        public init(
            itemID: VariableIntegerJava,
            cooldownTicks: VariableIntegerJava
        ) {
            self.itemID = itemID
            self.cooldownTicks = cooldownTicks
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [itemID, cooldownTicks]
        }
    }
}
