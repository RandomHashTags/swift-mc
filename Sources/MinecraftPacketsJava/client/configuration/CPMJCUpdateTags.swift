
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    // TODO: fix
    public struct UpdateTags: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id = ClientPacket.Mojang.Java.Configuration.updateTags
        
        public let lengthOfTheArray:VariableIntegerJava
        public let tagIdentifiers:[NamespaceJava]

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [lengthOfTheArray]
        }
    }
}
