
public protocol EndermanProtocol: MonsterProtocol, ~Copyable {
    // TODO: add carried variables
    func teleport() -> Bool

    func teleportTowards<T: EntityProtocol>(entity: T) -> Bool
}