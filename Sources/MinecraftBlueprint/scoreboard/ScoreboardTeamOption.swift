public enum ScoreboardTeamOption: String {
    case nameTagVisibility
    case death_message_visibility
    case collisionRule

    public enum Status: String {
        case always
        case never
        case for_other_teams
        case for_own_team
    }
}