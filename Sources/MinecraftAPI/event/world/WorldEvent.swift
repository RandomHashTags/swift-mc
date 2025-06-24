public protocol WorldEvent: Event {
    var world: any World { get }
}
