public protocol EntityTeleportEvent: EntityEventCancellable {
    var newLocation: any Location { get }
}
