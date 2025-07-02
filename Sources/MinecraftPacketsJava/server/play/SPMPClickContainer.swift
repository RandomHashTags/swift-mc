
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// This packet is sent by the client when the player clicks on a slot in a window.
    ///
    /// See [Inventory](https://wiki.vg/Inventory) for further information about how slots are indexed.
    ///
    /// When right-clicking on a stack of items, half the stack will be picked up and half left in the slot. If the stack is an odd number, the half left in the slot will be smaller of the amounts.
    ///
    /// The distinct type of click performed by the client is determined by the combination of the Mode and Button fields.
    ///
    /// Starting from version 1.5, “painting mode” is available for use in inventory windows. It is done by picking up stack of something (more than 1 item), then holding mouse button (left, right or middle) and dragging held stack over empty (or same type in case of right button) slots. In that case client sends the following to server after mouse button release (omitting first pickup packet which is sent as usual):
    /// 1. packet with mode 5, slot -999, button (0 for left | 4 for right);
    /// 2. packet for every slot painted on, mode is still 5, button (1 | 5);
    /// 3. packet with mode 5, slot -999, button (2 | 6);
    ///
    /// If any of the painting packets other than the “progress” ones are sent out of order (for example, a start, some slots, then another start; or a left-click in the middle) the painting status will be reset.
    public struct ClickContainer: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.clickContainer
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID = try packet.readUnsignedByte()
            let stateID:VariableIntegerJava = try packet.readVarInt()
            let slot = try packet.readShort()
            let button = try packet.readByte()
            let mode:Mode = try packet.readEnum()
            let slotsCount:VariableIntegerJava = try packet.readVarInt()
            let slotNumbers:[Int16] = try packet.readPacketArray(count: slotsCount.valueInt)
            let slotData:[SlotMojang] = try packet.readPacketArray(count: slotsCount.valueInt)
            let carriedItem:SlotMojang = try packet.readPacket()
            return Self(windowID: windowID, stateID: stateID, slot: slot, button: button, mode: mode, slotsCount: slotsCount, slotNumbers: slotNumbers, slotData: slotData, carriedItem: carriedItem)
        }
        
        /// The ID of the window which was clicked. 0 for player inventory.
        public let windowID:UInt8
        /// The last recieved State ID from either a [Set Container Slot](https://wiki.vg/Protocol#Set_Container_Slot) or a [Set Container Content](https://wiki.vg/Protocol#Set_Container_Content) packet.
        public let stateID:VariableIntegerJava
        /// The clicked slot number.
        public let slot:Int16
        /// The button used in the click
        public let button:Int8
        public let mode:Mode
        /// Maximum value for Notchian server is 128 slots.
        public let slotsCount:VariableIntegerJava
        public let slotNumbers:[Int16]
        public let slotData:[SlotMojang]
        /// Item carried by the cursor. Has to be empty (item ID = -1) for drop mode, otherwise nothing will happen.
        public let carriedItem:SlotMojang
        
        public enum Mode: Int, Codable, PacketEncodableMojangJava {
            case mouse
            case shiftClick
            case numberPad
            case middleClick
            case drop
            case drag
            case other
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [windowID, stateID, slot, button, mode, slotsCount]
            array.append(contentsOf: slotNumbers)
            array.append(contentsOf: slotData)
            array.append(carriedItem)
            return array
        }
    }
}
