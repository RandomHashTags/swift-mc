//
//  CPMPFeatureFlags.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import Packets

extension ClientPacket.Mojang.Java.Play {
    /// Used to enable and disable features, generally experimental ones, on the client.
    ///
    /// As of 1.20.1, the following feature flags are available:
    /// - `minecraft:vanilla` - enables vanilla features
    /// - `minecraft:bundle` - enables support for the bundle
    struct FeatureFlags : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.feature_flags
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let total_features:VariableIntegerJava = try packet.readVarInt()
            let feature_flags:[NamespaceJava] = try packet.read_packet_decodable_array(count: total_features)
            return Self(total_features: total_features, feature_flags: feature_flags)
        }
        
        public let total_features:VariableIntegerJava
        public let feature_flags:[NamespaceJava]
        
        public func encoded_values() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [total_features]
            array.append(contentsOf: feature_flags)
            return array
        }
    }
}
