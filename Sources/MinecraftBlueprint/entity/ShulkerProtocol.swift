
public protocol ShulkerProtocol: Colorable, GolemProtocol, HostileProtocol, ~Copyable {
    associatedtype Face: BlockFaceProtocol

    var peeking: Float { get }
    var attachedFace: Face { get }
}