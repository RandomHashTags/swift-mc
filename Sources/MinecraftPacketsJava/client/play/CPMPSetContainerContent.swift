
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetContainerContent: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setContainerContent

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID = try packet.readUnsignedByte()
            let stateID:VariableIntegerJava = try packet.readVarInt()
            let count:VariableIntegerJava = try packet.readVarInt()
            let slotData:[SlotMojang] = try packet.readPacketArray(count: count.valueInt)
            let carriedItem:SlotMojang = try packet.readPacket()
            return Self(windowID: windowID, stateID: stateID, count: count, slotData: slotData, carriedItem: carriedItem)
        }
        
        /// The ID of window which items are being sent for. 0 for player inventory.
        public let windowID:UInt8

        /// The last received State ID from either a Set Container Slot or a Set Container Content packet.
        public let stateID:VariableIntegerJava

        /// Number of elements in `slot_data`.
        public let count:VariableIntegerJava

        public let slotData:[SlotMojang]

        /// Item held by player.
        public let carriedItem:SlotMojang

        public init(
            windowID: UInt8,
            stateID: VariableIntegerJava,
            count: VariableIntegerJava,
            slotData: [SlotMojang],
            carriedItem: SlotMojang
        ) {
            self.windowID = windowID
            self.stateID = stateID
            self.count = count
            self.slotData = slotData
            self.carriedItem = carriedItem
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [windowID, stateID, count]
            array.append(contentsOf: slotData)
            array.append(carriedItem)
            return array
        }
    }
}
