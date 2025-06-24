public protocol EventListener {
    var priority: UInt8 { get }
    func handle(event: any Event)
}

public extension EventListener {
    var priority: UInt8 { EventPriority.normal }
}
