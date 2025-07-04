
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    /// Mods and plugins can use this to send their data. Minecraft itself uses several [plugin channels](https://wiki.vg/Plugin_channel ). These internal channels are in the `minecraft` namespace.
    /// More information on how it works on [Dinnerbone's blog](https://dinnerbone.com/blog/2012/01/13/minecraft-plugin-channels-messaging/ ). More documentation about internal and popular registered channels are [here](https://wiki.vg/Plugin_channel ).
    ///
    /// - Note: In Notchian client, the maximum data length is 1048576 bytes.
    public struct PluginMessage: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id = ClientPacket.Mojang.Java.Configuration.pluginMessage
        
        /// Name of the [plugin channel](https://wiki.vg/Plugin_channel) used to send the data.
        public let channel:NamespaceJava

        /// Any data. The length of this array must be inferred from the packet length.
        public let data:[UInt8]

        public init(
            channel: NamespaceJava,
            data: [UInt8]
        ) {
            self.channel = channel
            self.data = data
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var values:[any PacketEncodableMojangJava] = [channel]
            values.append(contentsOf: data)
            return values
        }
    }
}

// MARK: Parse
extension ClientPacket.Mojang.Java.Configuration.PluginMessage {
    @inlinable
    public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
        let channel:NamespaceJava = try packet.readIdentifier()
        let data = try packet.readRemainingByteArray()
        return Self(channel: channel, data: data)
    }
}