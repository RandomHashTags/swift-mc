
public struct PacketPlatform: Hashable, Sendable {
    public let id:UInt8

    public static let mojangJava = PacketPlatform(id: 0)
    public static let mojangBedrock = PacketPlatform(id: 1)
    public static let gluon = PacketPlatform(id: 2)
}
