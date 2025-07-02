
public protocol EntityEvent: Event, ~Copyable {
    var entity: any Entity { get }
}