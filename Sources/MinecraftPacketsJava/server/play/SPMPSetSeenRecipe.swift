
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when recipe is first seen in recipe book. Replaces Recipe Book Data, type 0.
    public struct SetSeenRecipe: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.setSeenRecipe

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let recipe:NamespaceJava = try packet.readIdentifier()
            return Self(recipe: recipe)
        }
        
        public let recipe:NamespaceJava

        public init(
            recipe: NamespaceJava
        ) {
            self.recipe = recipe
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [recipe]
        }
    }
}
