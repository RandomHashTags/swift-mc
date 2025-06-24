public protocol EntityEvent: Event {
    var entity: any Entity { get }
}
