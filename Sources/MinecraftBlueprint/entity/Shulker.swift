
public protocol Shulker: Colorable, Golem, Hostile, ~Copyable {
    var peeking: Float { get }
    var attachedFace: any BlockFace { get }
}