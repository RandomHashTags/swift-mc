
public protocol PlayerJoinEvent: PlayerEvent, ~Copyable {
    init(_ player: any Player)
}