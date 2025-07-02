
public protocol Scoreboard: Sendable, ~Copyable {
    var objectives: [ScoreboardObjective] { get }
    var teams: [ScoreboardTeam] { get }
}