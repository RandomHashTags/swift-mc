
public protocol SoundGroupProtocol: MinecraftIdentifiable {
    associatedtype SoundEvent: SoundEventProtocol

    var volume: Float { get }
    var pitch: Float { get }
    var soundBreak: SoundEvent { get }
    var soundStep: SoundEvent { get }
    var soundPlace: SoundEvent { get }
    var soundHit: SoundEvent { get }
    var soundFall: SoundEvent { get }
}
