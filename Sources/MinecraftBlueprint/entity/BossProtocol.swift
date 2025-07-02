
public protocol BossProtocol: EntityProtocol, ~Copyable {
    associatedtype BossBar: BossBarProtocol

    var bossBar: BossBar? { get }
}