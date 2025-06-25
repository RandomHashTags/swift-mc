
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    /// Used to enable and disable features, generally experimental ones, on the client.
    ///
    /// As of 1.20.2, the following feature flags are available:
    /// - minecraft:vanilla - enables vanilla features
    /// - minecraft:bundle - enables support for the bundle
    /// - minecraft:trade\_rebalance - enables support for the rebalanced villager trades
    struct FeatureFlags: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id = ClientPacket.Mojang.Java.Configuration.featureFlags

        public let totalFeatures:VariableIntegerJava
        public let featureFlags:[NamespaceJava]

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var values:[any PacketEncodableMojangJava] = [totalFeatures]
            values.append(contentsOf: featureFlags)
            return values
        }
    }
}
