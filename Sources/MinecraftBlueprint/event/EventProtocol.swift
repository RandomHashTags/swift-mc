
public protocol EventProtocol: Sendable, ~Copyable {
    var eventType: any EventTypeProtocol { get }
}