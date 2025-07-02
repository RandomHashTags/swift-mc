
public enum ScoreboardTeamOption: String, Sendable {
    case nameTagVisibility
    case deathMessageVisibility
    case collisionRule

    public enum Status: String, Sendable {
        case always
        case never
        case forOtherTeams
        case forOwnTeam
    }
}