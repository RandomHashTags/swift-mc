import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Sent by the server when an item in a slot (in a window) is added/removed.
    ///
    /// To set the cursor (the item currently dragged with the mouse), use -1 as Window ID and as Slot.
    ///
    /// This packet can only be used to edit the hotbar and offhand of the player's inventory if window ID is set to 0 (slots 36 through 45) if the player is in creative, with their inventory open, and not in their survival inventory tab. Otherwise, when window ID is 0, it can edit any slot in the player's inventory. If the window ID is set to -2, then any slot in the inventory can be used but no add item animation will be played.
    struct SetContainerSlot: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setContainerSlot
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID:Int8 = try packet.readByte()
            let stateID:VariableIntegerJava = try packet.readVarInt()
            let slot:Int16 = try packet.readShort()
            let slot_data:SlotMojang = try packet.readPacket()
            return Self(windowID: windowID, stateID: stateID, slot: slot, slot_data: slot_data)
        }
        
        /// The window which is being updated. 0 for player inventory.
        /// > Note: All known window types include the player inventory. This packet will only be sent for the currently opened window while the player is performing actions, even if it affects the player inventory. After the window is closed, a number of these packets are sent to update the player's inventory window (0).
        public let windowID:Int8
        /// The last received State ID from either a Set Container Slot or a Set Container Content packet.
        public let stateID:VariableIntegerJava
        /// The slot that should be updated.
        public let slot:Int16
        public let slot_data:SlotMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                windowID,
                stateID,
                slot,
                slot_data
            ]
        }
    }
}
