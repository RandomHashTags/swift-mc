
public protocol SoundGroup: MinecraftIdentifiable {
    var volume: Float { get }
    var pitch: Float { get }
    var soundBreak: any SoundEvent { get }
    var soundStep: any SoundEvent { get }
    var soundPlace: any SoundEvent { get }
    var soundHit: any SoundEvent { get }
    var soundFall: any SoundEvent { get }
}
