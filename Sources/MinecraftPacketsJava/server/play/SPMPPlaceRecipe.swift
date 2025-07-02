
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// This packet is sent when a player clicks a recipe in the crafting book that is craftable (white border).
    public struct PlaceRecipe: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.placeRecipe

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID = try packet.readByte()
            let recipe:NamespaceJava = try packet.readIdentifier()
            let makeAll = try packet.readBool()
            return Self(windowID: windowID, recipe: recipe, makeAll: makeAll)
        }
        
        public let windowID:Int8
        public let recipe:NamespaceJava
        /// Affects the amount of items processed; true if shift is down when clicked.
        public let makeAll:Bool

        public init(
            windowID: Int8,
            recipe: NamespaceJava,
            makeAll: Bool
        ) {
            self.windowID = windowID
            self.recipe = recipe
            self.makeAll = makeAll
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID, recipe, makeAll]
        }
    }
}
