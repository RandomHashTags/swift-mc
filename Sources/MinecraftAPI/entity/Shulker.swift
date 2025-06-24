public protocol Shulker: Colorable, Golem, Hostile {
    var peeking: Float { get }
    var attachedFace: any BlockFace { get }
}