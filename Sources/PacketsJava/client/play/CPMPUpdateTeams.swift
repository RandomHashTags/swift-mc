//
//  CPMPUpdateTeams.swift
//  
//
//  Created by Evan Anderson on 8/8/23.
//

import Packets

extension ClientPacket.Mojang.Java.Play {
    /// Creates and updates teams.
    struct UpdateTeams : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.updateTeams
        
        /// A unique name for the team. (Shared with scoreboard).
        public let team_name:String
        /// Determines the layout of the remaining packet.
        public let mode:UpdateTeams.Mode
        
        // Remove Team has no fields
        
        // Create Team, Update Team Info
        public let teamDisplayName:ChatPacketMojang?
        /// Bit mask. 0x01: Allow friendly fire, 0x02: can see invisible players on same team.
        public let friendly_flags:Int8?
        public let nameTagVisibility:UpdateTeams.NameTagVisibility?
        public let collisionRule:UpdateTeams.CollisionRule?
        /// Used to color the name of players on the team.
        public let teamColor:VariableIntegerJava? // TODO: add `TeamColor enum`
        /// Displayed before the names of players that are part of this team.
        public let teamPrefix:ChatPacketMojang?
        /// Displayed after the names of players that are part of this team.
        public let teamSuffix:ChatPacketMojang?
        
        // + create_team || add_entities_to_team || remove_entities_from_team
        /// Number of elements in `entities`.
        public let entityCount:VariableIntegerJava?
        // + create_team || add_entities_to_team || remove_entities_from_team
        /// Identifiers for the entities in this team. For players, this is their username; for other entities, it is their UUID.
        public let entities:[String]?
        
        public enum Mode : Int, Codable, PacketEncodableMojangJava {
            case create_team =               0
            case remove_team =               1
            case update_team_info =          2
            case add_entities_to_team =      3
            case remove_entities_from_team = 4
        }
        
        public enum NameTagVisibility : String, Codable, PacketEncodableMojangJava {
            case always
            case hideForOtherTeams
            case hideForOwnTeam
            case never
        }
        
        public enum CollisionRule : String, Codable, PacketEncodableMojangJava {
            case always
            case pushOtherTeams
            case pushOwnTeam
            case never
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [
                team_name,
                mode
            ]
            var secondary:[(any PacketEncodableMojangJava)?]
            switch mode {
            case .create_team, .update_team_info:
                let precondition:String = "mode == .\(mode)"
                let teamDisplayName:ChatPacketMojang = try unwrapOptional(teamDisplayName, key_path: \UpdateTeams.teamDisplayName, precondition: precondition)
                let friendly_flags:Int8 = try unwrapOptional(friendly_flags, key_path: \UpdateTeams.friendly_flags, precondition: precondition)
                let nameTagVisibility:UpdateTeams.NameTagVisibility = try unwrapOptional(nameTagVisibility, key_path: \UpdateTeams.nameTagVisibility, precondition: precondition)
                let collisionRule:UpdateTeams.CollisionRule = try unwrapOptional(collisionRule, key_path: \UpdateTeams.collisionRule, precondition: precondition)
                let teamColor:VariableIntegerJava = try unwrapOptional(teamColor, key_path: \UpdateTeams.teamColor, precondition: precondition)
                let teamPrefix:ChatPacketMojang = try unwrapOptional(teamPrefix, key_path: \UpdateTeams.teamPrefix, precondition: precondition)
                let teamSuffix:ChatPacketMojang = try unwrapOptional(teamSuffix, key_path: \UpdateTeams.teamSuffix, precondition: precondition)
                secondary = [
                    teamDisplayName,
                    friendly_flags,
                    nameTagVisibility,
                    collisionRule,
                    teamColor,
                    teamPrefix,
                    teamSuffix
                ]
                if mode == .create_team {
                    let entityCount:VariableIntegerJava = try unwrapOptional(entityCount, key_path: \UpdateTeams.entityCount, precondition: precondition)
                    let entities:[String] = try unwrapOptional(entities, key_path: \UpdateTeams.entities, precondition: precondition)
                    secondary.append(entityCount)
                    secondary.append(contentsOf: entities)
                }
                break
            case .remove_team:
                secondary = []
                break
            case .add_entities_to_team, .remove_entities_from_team:
                let precondition:String = "mode == .\(mode)"
                let entityCount:VariableIntegerJava = try unwrapOptional(entityCount, key_path: \UpdateTeams.entityCount, precondition: precondition)
                let entities:[String] = try unwrapOptional(entities, key_path: \UpdateTeams.entities, precondition: precondition)
                secondary = [entityCount]
                secondary.append(contentsOf: entities)
                break
            }
            array.append(contentsOf: secondary)
            
            return array
        }
    }
}
