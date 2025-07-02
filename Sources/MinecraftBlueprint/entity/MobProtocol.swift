
public protocol MobProtocol: LivingEntityProtocol, Lootable, ~Copyable {
    var isAware: Bool { get }
    var soundAmbient: (any SoundProtocol)? { get }
    var target: (any LivingEntityProtocol)? { get }
}