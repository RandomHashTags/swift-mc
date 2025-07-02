
public protocol EntityTeleportEventProtocol: EntityEventCancellableProtocol, ~Copyable {
    var newLocation: any LocationProtocol { get }
}