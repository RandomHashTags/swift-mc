import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// Replaces Recipe Book Data, type 1.
    struct ChangeRecipeBookSettings: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.changeRecipeBookSettings
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let book:ChangeRecipeBookSettings.BookID = try packet.readEnum()
            let book_open:Bool = try packet.readBool()
            let filter_active:Bool = try packet.readBool()
            return Self(book: book, book_open: book_open, filter_active: filter_active)
        }
        
        public let book:ChangeRecipeBookSettings.BookID
        public let book_open:Bool
        public let filter_active:Bool
        
        public enum BookID: Int, Codable, PacketEncodableMojangJava {
            case crafting
            case furnace
            case blast_furnace
            case smoker
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [book, book_open, filter_active]
        }
    }
}
