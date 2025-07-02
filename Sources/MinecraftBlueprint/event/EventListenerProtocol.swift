
public protocol EventListenerProtocol: Sendable, ~Copyable {
    var priority: UInt8 { get }
    func handle(event: any EventProtocol)
}

extension EventListenerProtocol {
    @inlinable
    public var priority: UInt8 {
        EventPriority.normal
    }
}
