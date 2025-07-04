
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Used to swap out an empty space on the hotbar with the item in the given inventory slot. The Notchian client uses this for pick block functionality (middle click) to retrieve items from the inventory.
    ///
    /// The server will first search the player's hotbar for an empty slot, starting from the current slot and looping around to the slot before it. If there are no empty slots, it will start a second search from the current slot and find the first slot that does not contain an enchanted item. If there still are no slots that meet that criteria, then the server will use the currently selected slot.
    ///
    /// After finding the appropriate slot, the server swaps the items and then send 3 packets:
    /// - [Set Container Slot](https://wiki.vg/Protocol#Set_Container_Slot ), with window ID set to -2 and slot set to the newly chosen slot and the item set to the item that is now in that slot (which was previously at the slot the client requested)
    /// - Set Slot, with window ID set to -2 and slot set to the slot the player requested, with the item that is now in that slot and was previously on the hotbar slot
    /// - [Set Held Item](https://wiki.vg/Protocol#Set_Held_Item ), with the slot set to the newly chosen slot.
    public struct PickItem: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.pickItem
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let slotToUse:VariableIntegerJava = try packet.readVarInt()
            return Self(slotToUse: slotToUse)
        }
        
        public let slotToUse:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [slotToUse]
        }
    }
}
