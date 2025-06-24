public protocol PlayerGameModeChangeEvent: PlayerEventCancellable {
    var newGameMode: any GameMode { get }
}
