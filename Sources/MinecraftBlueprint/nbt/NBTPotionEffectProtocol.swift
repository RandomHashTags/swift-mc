
public protocol NBTPotionEffectProtocol: NBTTagProtocol {
    var ambient: Bool { get }
    var amplifier: Bool { get }
    var duration: Int { get }
    var hiddenEffect: String { get } // TODO: fix
    var id: Int { get }
    var showIcon: Bool { get }
    var showParticles: Bool { get }
}