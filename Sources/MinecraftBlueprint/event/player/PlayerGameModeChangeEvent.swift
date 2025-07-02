
public protocol PlayerGameModeChangeEvent: PlayerEventCancellable, ~Copyable {
    var newGameMode: any GameMode { get }
}