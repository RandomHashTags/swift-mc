
public protocol Cancellable: Sendable, ~Copyable {
    var isCancelled: Bool { get }
}