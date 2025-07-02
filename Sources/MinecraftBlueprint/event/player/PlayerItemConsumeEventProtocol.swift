
public protocol PlayerItemConsumeEventProtocol: PlayerEventProtocol, Cancellable, ~Copyable {
    var item: any ItemStackProtocol { get }
    
    init(
        player: any PlayerProtocol,
        item: inout any ItemStackProtocol
    )
}