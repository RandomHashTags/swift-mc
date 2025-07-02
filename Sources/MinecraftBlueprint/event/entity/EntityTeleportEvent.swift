
public protocol EntityTeleportEvent: EntityEventCancellable, ~Copyable {
    var newLocation: any Location { get }
}