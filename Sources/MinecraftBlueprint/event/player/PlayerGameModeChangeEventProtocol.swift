
public protocol PlayerGameModeChangeEventProtocol: PlayerEventCancellableProtocol, ~Copyable {
    var newGameMode: any GameModeProtocol { get }
}