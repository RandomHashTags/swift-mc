public protocol Enderman: Monster {
    // TODO: add carried variables
    func teleport() -> Bool
    func teleportTowards(entity: any Entity) -> Bool
}