
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Replaces Recipe Book Data, type 1.
    public struct ChangeRecipeBookSettings: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.changeRecipeBookSettings
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let book:ChangeRecipeBookSettings.BookID = try packet.readEnum()
            let bookOpen = try packet.readBool()
            let filterActive = try packet.readBool()
            return Self(book: book, bookOpen: bookOpen, filterActive: filterActive)
        }
        
        public let book:ChangeRecipeBookSettings.BookID
        public let bookOpen:Bool
        public let filterActive:Bool
        
        public enum BookID: Int, Codable, PacketEncodableMojangJava {
            case crafting
            case furnace
            case blastFurnace
            case smoker
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [book, bookOpen, filterActive]
        }
    }
}
