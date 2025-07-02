
public protocol Event: Sendable, ~Copyable {
    var eventType: any EventType { get }
}