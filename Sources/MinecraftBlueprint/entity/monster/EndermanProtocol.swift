
public protocol EndermanProtocol: MonsterProtocol, ~Copyable {
    // TODO: add carried variables
    func teleport() -> Bool
    func teleportTowards(entity: any EntityProtocol) -> Bool
}