
public protocol ShulkerProtocol: Colorable, GolemProtocol, HostileProtocol, ~Copyable {
    var peeking: Float { get }
    var attachedFace: any BlockFaceProtocol { get }
}