public protocol PlayerEvent: Event {
    var player: any Player { get }
}
