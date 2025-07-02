
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// This packet is sent when an entity has been [leashed](https://minecraft.fandom.com/wiki/Lead) to another entity.
    public struct LinkEntities: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.linkEntities

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let attachedEntityID = try packet.readInt()
            let holdingEntityID = try packet.readInt()
            return Self(attachedEntityID: attachedEntityID, holdingEntityID: holdingEntityID)
        }
        
        /// Attached entity's EID.
        public let attachedEntityID:Int32

        /// ID of the entity holding the lead. Set to -1 to detach.
        public let holdingEntityID:Int32

        public init(
            attachedEntityID: Int32,
            holdingEntityID: Int32
        ) {
            self.attachedEntityID = attachedEntityID
            self.holdingEntityID = holdingEntityID
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [attachedEntityID, holdingEntityID]
        }
    }
}
