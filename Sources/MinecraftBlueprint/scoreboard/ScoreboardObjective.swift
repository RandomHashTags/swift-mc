
public protocol ScoreboardObjective: Sendable, ~Copyable {
    var name: String { get }
    var displayName: String { get }
    var criteria: String { get }
}
