
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent as a player is renaming an item in an anvil (each keypress in the anvil UI sends a new Rename Item packet). If the new name is empty, then the item loses its custom name (this is different from setting the custom name to the normal name of the item). The item name may be no longer than 50 characters long, and if it is longer than that, then the rename is silently ignored.
    public struct RenameItem: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.rename_item
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let name = try packet.readString()
            return Self(name: name)
        }
        
        /// The new name of the item.
        public let name:String
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [name]
        }
    }
}
