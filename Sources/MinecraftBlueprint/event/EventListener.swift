public protocol EventListener {
    var priority: UInt8 { get }
    func handle(event: any Event)
}

extension EventListener {
    @inlinable
    public var priority: UInt8 {
        EventPriority.normal
    }
}
