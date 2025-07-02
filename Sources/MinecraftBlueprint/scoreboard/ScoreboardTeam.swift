
public protocol ScoreboardTeam: Sendable, ~Copyable {
    var name: String { get }
    var displayName: String { get }
    var prefix: String? { get }
    var suffix: String? { get }
    
    var allowsFriendlyFire: Bool { get }
    var canSeeFriendlyInvisibles: Bool { get }
    
    var options: [ScoreboardTeamOption: ScoreboardTeamOption.Status] { get }
}