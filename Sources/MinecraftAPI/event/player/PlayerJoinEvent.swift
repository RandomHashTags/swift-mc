public protocol PlayerJoinEvent: PlayerEvent {
    init(_ player: any Player)
}
