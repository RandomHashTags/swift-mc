
public protocol Enderman: Monster, ~Copyable {
    // TODO: add carried variables
    func teleport() -> Bool
    func teleportTowards(entity: any Entity) -> Bool
}