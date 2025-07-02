
public protocol PlayerJoinEventProtocol: PlayerEventProtocol, ~Copyable {
    init(
        _ player: any PlayerProtocol
    )
}