
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    /// Represents certain registries that are sent from the server and are applied on the client.
    public struct RegistryData: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id = ClientPacket.Mojang.Java.Configuration.registryData
        
        // TODO: fix (supposed to be a NBT Tag Compound, not a string)
        /// See [Registry Data](https://wiki.vg/Registry_Data ).
        public let registryCodec:String

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [registryCodec]
        }
    }
}
