//
//  CPMPLinkEntities.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import Packets

extension ClientPacket.Mojang.Java.Play {
    /// This packet is sent when an entity has been [leashed](https://minecraft.fandom.com/wiki/Lead) to another entity.
    struct LinkEntities : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.link_entities
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let attached_entity_id:Int32 = try packet.readInt()
            let holding_entity_id:Int32 = try packet.readInt()
            return Self(attached_entity_id: attached_entity_id, holding_entity_id: holding_entity_id)
        }
        
        /// Attached entity's EID.
        public let attached_entity_id:Int32
        /// ID of the entity holding the lead. Set to -1 to detach.
        public let holding_entity_id:Int32
        
        public func encoded_values() throws -> [(any PacketEncodableMojangJava)?] {
            return [attached_entity_id, holding_entity_id]
        }
    }
}
