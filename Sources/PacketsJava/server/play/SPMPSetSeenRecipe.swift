//
//  SPMPSetSeenRecipe.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import Packets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when recipe is first seen in recipe book. Replaces Recipe Book Data, type 0.
    struct SetSeenRecipe : ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.set_seen_recipe
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let recipe:NamespaceJava = try packet.readIdentifier()
            return Self(recipe: recipe)
        }
        
        public let recipe:NamespaceJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [recipe]
        }
    }
}
