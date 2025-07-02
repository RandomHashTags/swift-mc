
public protocol EntityTypeProtocol: MinecraftIdentifiable, Nameable, ServerTickChangeListenerProtocol {
    var isAffectedByGravity: Bool { get }
    var isDamageable: Bool { get }

    var receivesFallDamage: Bool { get }

    var noDamageTicksMaximum: Int { get }
    var fireTicksMaximum: Int { get }
    var freezeTicksMaximum: Int { get }
}