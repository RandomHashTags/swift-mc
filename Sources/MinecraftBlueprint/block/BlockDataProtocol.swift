
public protocol BlockDataProtocol: BlockMovableProtocol, ~Copyable {
    associatedtype Material: MaterialProtocol
    associatedtype SoundGroup: SoundGroupProtocol

    var material: Material { get }
    var placementMaterial: Material { get }

    var hasCollision: Bool { get }

    var explosionResistance: Float { get }

    var isRandomlyTicking: Bool { get }

    var soundGroup: SoundGroup { get }

    var friction: Float { get }

    var speedFactor: Float { get }

    var jumpFactor: Float { get }

    var dynamicShape: Bool { get }

    var lightLevel: Int { get }

    var isOccluding: Bool { get }

    var mapColor: Color { get }

    var requiresCorrectToolForDrops: Bool { get }
}