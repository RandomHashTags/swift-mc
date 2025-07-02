
public protocol PlayerEventProtocol: EventProtocol, ~Copyable {
    var player: any PlayerProtocol { get }
}