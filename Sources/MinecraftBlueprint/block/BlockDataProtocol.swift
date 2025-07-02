
public protocol BlockDataProtocol: BlockMovableProtocol, ~Copyable {
    var material: any MaterialProtocol { get }
    var placementMaterial: any MaterialProtocol { get }

    var hasCollision: Bool { get }

    var explosionResistance: Float { get }

    var isRandomlyTicking: Bool { get }

    var soundGroup: any SoundGroupProtocol { get }

    var friction: Float { get }

    var speedFactor: Float { get }

    var jumpFactor: Float { get }

    var dynamicShape: Bool { get }

    var lightLevel: Int { get }

    var isOccluding: Bool { get }

    var mapColor: Color { get }

    var requiresCorrectToolForDrops: Bool { get }
}