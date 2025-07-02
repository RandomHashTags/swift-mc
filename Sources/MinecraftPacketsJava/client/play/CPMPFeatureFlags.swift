
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Used to enable and disable features, generally experimental ones, on the client.
    ///
    /// As of 1.20.1, the following feature flags are available:
    /// - `minecraft:vanilla` - enables vanilla features
    /// - `minecraft:bundle` - enables support for the bundle
    public struct FeatureFlags: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.featureFlags

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let totalFeatures:VariableIntegerJava = try packet.readVarInt()
            let featureFlags:[NamespaceJava] = try packet.readPacketArray(count: totalFeatures.valueInt)
            return Self(totalFeatures: totalFeatures, featureFlags: featureFlags)
        }
        
        public let totalFeatures:VariableIntegerJava
        public let featureFlags:[NamespaceJava]

        public init(
            totalFeatures: VariableIntegerJava,
            featureFlags: [NamespaceJava]
        ) {
            self.totalFeatures = totalFeatures
            self.featureFlags = featureFlags
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [totalFeatures]
            array.append(contentsOf: featureFlags)
            return array
        }
    }
}
