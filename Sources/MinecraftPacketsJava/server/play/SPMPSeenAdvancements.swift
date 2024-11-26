//
//  SPMPSeenAdvancements.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    struct SeenAdvancements : ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.seenAdvancements
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let action:SeenAdvancements.Action = try packet.readEnum()
            let tab_id:NamespaceJava? = action == .opened_tab ? try packet.readIdentifier() : nil
            return Self(action: action, tab_id: tab_id)
        }
        
        public let action:SeenAdvancements.Action
        /// Only present if action is Opened tab.
        public let tab_id:NamespaceJava?
        
        public enum Action : Int, Codable, PacketEncodableMojangJava {
            case opened_tab
            case closed_screen
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [action]
            switch action {
            case .opened_tab:
                let tab_id:NamespaceJava = try unwrapOptional(tab_id, key_path: \Self.tab_id, precondition: "action == .opened_tab")
                array.append(tab_id)
                break
            case .closed_screen:
                break
            }
            return array
        }
    }
}
