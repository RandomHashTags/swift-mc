import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// This packet is sent when a player clicks a recipe in the crafting book that is craftable (white border).
    struct PlaceRecipe: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.placeRecipe
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID:Int8 = try packet.readByte()
            let recipe:NamespaceJava = try packet.readIdentifier()
            let make_all:Bool = try packet.readBool()
            return Self(windowID: windowID, recipe: recipe, make_all: make_all)
        }
        
        public let windowID:Int8
        public let recipe:NamespaceJava
        /// Affects the amount of items processed; true if shift is down when clicked.
        public let make_all:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID, recipe, make_all]
        }
    }
}
