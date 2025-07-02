
public protocol WorldEvent: Event, ~Copyable {
    var world: any World { get }
}