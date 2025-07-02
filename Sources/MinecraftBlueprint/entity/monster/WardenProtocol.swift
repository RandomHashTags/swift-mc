
public protocol WardenProtocol: MonsterProtocol, ~Copyable {
    var anger: Int { get }
    var angryAt: (any LivingEntityProtocol)? { get }
    var angerLevel: any WardenAngerLevelProtocol { get }
}