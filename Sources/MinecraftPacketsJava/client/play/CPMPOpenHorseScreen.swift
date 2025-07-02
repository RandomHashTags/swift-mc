
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// This packet is used exclusively for opening the horse GUI. Open Screen is used for all other GUIs. The client will not open the inventory if the Entity ID does not point to an horse-like animal.
    public struct OpenHorseScreen: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.openHorseScreen

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID = try packet.readUnsignedByte()
            let slotCount:VariableIntegerJava = try packet.readVarInt()
            let entityID = try packet.readInt()
            return Self(windowID: windowID, slotCount: slotCount, entityID: entityID)
        }
        
        public let windowID:UInt8
        public let slotCount:VariableIntegerJava
        public let entityID:Int32

        public init(
            windowID: UInt8,
            slotCount: VariableIntegerJava,
            entityID: Int32
        ) {
            self.windowID = windowID
            self.slotCount = slotCount
            self.entityID = entityID
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID, slotCount, entityID]
        }
    }
}
