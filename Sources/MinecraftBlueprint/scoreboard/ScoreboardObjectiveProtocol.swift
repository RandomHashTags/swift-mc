
public protocol ScoreboardObjectiveProtocol: Sendable, ~Copyable {
    var name: String { get }
    var displayName: String { get }
    var criteria: String { get }
}
