
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Creates and updates teams.
    public struct UpdateTeams: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.updateTeams
        
        /// A unique name for the team. (Shared with scoreboard).
        public let teamName:String
        /// Determines the layout of the remaining packet.
        public let mode:Mode
        
        // Remove Team has no fields
        
        // Create Team, Update Team Info
        public let teamDisplayName:ChatPacketMojang?
        /// Bit mask. 0x01: Allow friendly fire, 0x02: can see invisible players on same team.
        public let friendlyFlags:Int8?
        public let nameTagVisibility:NameTagVisibility?
        public let collisionRule:CollisionRule?
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
        
        public enum Mode: Int, Codable, PacketEncodableMojangJava {
            case createTeam =             0
            case removeTeam =             1
            case updateTeamInfo =         2
            case addEntitiesToTeam =      3
            case removeEntitiesFromTeam = 4
        }
        
        public enum NameTagVisibility: String, Codable, PacketEncodableMojangJava {
            case always
            case hideForOtherTeams
            case hideForOwnTeam
            case never
        }
        
        public enum CollisionRule: String, Codable, PacketEncodableMojangJava {
            case always
            case pushOtherTeams
            case pushOwnTeam
            case never
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [
                teamName,
                mode
            ]
            var secondary:[(any PacketEncodableMojangJava)?]
            switch mode {
            case .createTeam, .updateTeamInfo:
                let precondition = "mode == .\(mode)"
                let teamDisplayName = try unwrapOptional(teamDisplayName, key: \UpdateTeams.teamDisplayName, precondition: precondition)
                let friendlyFlags = try unwrapOptional(friendlyFlags, key: \UpdateTeams.friendlyFlags, precondition: precondition)
                let nameTagVisibility = try unwrapOptional(nameTagVisibility, key: \UpdateTeams.nameTagVisibility, precondition: precondition)
                let collisionRule = try unwrapOptional(collisionRule, key: \UpdateTeams.collisionRule, precondition: precondition)
                let teamColor = try unwrapOptional(teamColor, key: \UpdateTeams.teamColor, precondition: precondition)
                let teamPrefix = try unwrapOptional(teamPrefix, key: \UpdateTeams.teamPrefix, precondition: precondition)
                let teamSuffix = try unwrapOptional(teamSuffix, key: \UpdateTeams.teamSuffix, precondition: precondition)
                secondary = [
                    teamDisplayName,
                    friendlyFlags,
                    nameTagVisibility,
                    collisionRule,
                    teamColor,
                    teamPrefix,
                    teamSuffix
                ]
                if mode == .createTeam {
                    let entityCount = try unwrapOptional(entityCount, key: \UpdateTeams.entityCount, precondition: precondition)
                    let entities = try unwrapOptional(entities, key: \UpdateTeams.entities, precondition: precondition)
                    secondary.append(entityCount)
                    secondary.append(contentsOf: entities)
                }
            case .removeTeam:
                secondary = []
            case .addEntitiesToTeam, .removeEntitiesFromTeam:
                let precondition = "mode == .\(mode)"
                let entityCount = try unwrapOptional(entityCount, key: \UpdateTeams.entityCount, precondition: precondition)
                let entities = try unwrapOptional(entities, key: \UpdateTeams.entities, precondition: precondition)
                secondary = [entityCount]
                secondary.append(contentsOf: entities)
            }
            array.append(contentsOf: secondary)
            return array
        }
    }
}
