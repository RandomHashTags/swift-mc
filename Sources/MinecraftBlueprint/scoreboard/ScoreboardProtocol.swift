
public protocol ScoreboardProtocol: Sendable, ~Copyable {
    associatedtype Objective: ScoreboardObjectiveProtocol
    associatedtype Team: ScoreboardTeamProtocol

    var objectives: [Objective] { get }
    var teams: [Team] { get }
}