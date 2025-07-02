
public protocol PlayerEvent: Event, ~Copyable {
    var player: any Player { get }
}