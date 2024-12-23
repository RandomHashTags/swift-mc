//
//  CPMJCUpdateTags.swift
//
//
//  Created by Evan Anderson on 11/15/23.
//

import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    // TODO: fix
    struct UpdateTags : ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id:ClientPacket.Mojang.Java.Configuration = ClientPacket.Mojang.Java.Configuration.updateTags
        
        public let length_of_the_array:VariableIntegerJava
        public let tag_identifiers:[NamespaceJava]
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [length_of_the_array]
        }
    }
}
