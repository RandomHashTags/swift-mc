
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Sent by the server when someone picks up an item lying on the ground — its sole purpose appears to be the animation of the item flying towards you. It doesn't destroy the entity in the client memory, and it doesn't add it to your inventory. The server only checks for items to be picked up after each Set Player Position (and Set Player Position And Rotation) packet sent by the client. The collector entity can be any entity; it does not have to be a player. The collected entity also can be any entity, but the Notchian server only uses this for items, experience orbs, and the different varieties of arrows.
    public struct PickupItem: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.pickupItem

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let collectedEntityID:VariableIntegerJava = try packet.readVarInt()
            let collectorEntityID:VariableIntegerJava = try packet.readVarInt()
            let pickupItemCount:VariableIntegerJava = try packet.readVarInt()
            return Self(collectedEntityID: collectedEntityID, collectorEntityID: collectorEntityID, pickupItemCount: pickupItemCount)
        }
        
        public let collectedEntityID:VariableIntegerJava

        public let collectorEntityID:VariableIntegerJava

        /// Seems to be 1 for XP orbs, otherwise the number of items in the stack.
        public let pickupItemCount:VariableIntegerJava

        public init(
            collectedEntityID: VariableIntegerJava,
            collectorEntityID: VariableIntegerJava,
            pickupItemCount: VariableIntegerJava
        ) {
            self.collectedEntityID = collectedEntityID
            self.collectorEntityID = collectorEntityID
            self.pickupItemCount = pickupItemCount
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [collectedEntityID, collectorEntityID, pickupItemCount]
        }
    }
}
