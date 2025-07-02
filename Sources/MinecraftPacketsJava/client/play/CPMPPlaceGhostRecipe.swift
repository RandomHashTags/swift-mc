
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Response to the serverbound packet ([Place Recipe](https://wiki.vg/Protocol#Place_Recipe) ), with the same recipe ID. Appears to be used to notify the UI.
    public struct PlaceGhostRecipe: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.placeGhostRecipe

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID = try packet.readByte()
            let recipe:NamespaceJava = try packet.readIdentifier()
            return Self(windowID: windowID, recipe: recipe)
        }
        
        public let windowID:Int8
        public let recipe:NamespaceJava

        public init(
            windowID: Int8,
            recipe: NamespaceJava
        ) {
            self.windowID = windowID
            self.recipe = recipe
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID, recipe]
        }
    }
}
