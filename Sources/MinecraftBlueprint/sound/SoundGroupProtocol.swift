
public protocol SoundGroupProtocol: MinecraftIdentifiable {
    var volume: Float { get }
    var pitch: Float { get }
    var soundBreak: any SoundEventProtocol { get }
    var soundStep: any SoundEventProtocol { get }
    var soundPlace: any SoundEventProtocol { get }
    var soundHit: any SoundEventProtocol { get }
    var soundFall: any SoundEventProtocol { get }
}
