import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Used to enable and disable features, generally experimental ones, on the client.
    ///
    /// As of 1.20.1, the following feature flags are available:
    /// - `minecraft:vanilla` - enables vanilla features
    /// - `minecraft:bundle` - enables support for the bundle
    struct FeatureFlags: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.featureFlags
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let total_features:VariableIntegerJava = try packet.readVarInt()
            let featureFlags:[NamespaceJava] = try packet.readPacketArray(count: total_features.valueInt)
            return Self(total_features: total_features, featureFlags: featureFlags)
        }
        
        public let total_features:VariableIntegerJava
        public let featureFlags:[NamespaceJava]
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [total_features]
            array.append(contentsOf: featureFlags)
            return array
        }
    }
}
