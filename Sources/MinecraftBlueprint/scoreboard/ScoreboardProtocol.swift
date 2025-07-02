
public protocol ScoreboardProtocol: Sendable, ~Copyable {
    var objectives: [ScoreboardObjectiveProtocol] { get }
    var teams: [ScoreboardTeamProtocol] { get }
}