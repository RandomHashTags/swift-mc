
import MinecraftPackets

extension ServerPacket.Mojang.Java.Configuration {
    /// Mods and plugins can use this to send their data. Minecraft itself uses some [plugin channels](https://wiki.vg/Plugin_channel ). These internal channels are in the `minecraft` namespace.
    ///
    /// [More documentation on this](https://dinnerbone.com/blog/2012/01/13/minecraft-plugin-channels-messaging/ ).
    ///
    /// Note that the length of Data is known only from the packet length, since the packet has no length field of any kind.
    ///
    /// - Note: In Notchian server, the maximum data length is 32767 bytes.
    public struct PluginMessage: ServerPacketMojangJavaConfigurationProtocol {
        public static let id = ServerPacket.Mojang.Java.Configuration.pluginMessage

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let channel:NamespaceJava = try packet.readIdentifier()
            let data = try packet.readRemainingByteArray()
            return Self(channel: channel, data: data)
        }

        /// Name of the [plugin channel](https://wiki.vg/Plugin_channel) used to send the data.
        public let channel:NamespaceJava

        /// Any data, depending on the channel. `minecraft:` channels are documented [here](https://wiki.vg/Plugin_channel ). The length of this array must be inferred from the packet length.
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
