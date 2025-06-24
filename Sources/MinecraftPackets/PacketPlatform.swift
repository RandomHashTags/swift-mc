
public struct PacketPlatform: Hashable, Sendable {
    public let id:UInt8

    public static let mojang_java:PacketPlatform = PacketPlatform(id: 0)
    public static let mojang_bedrock:PacketPlatform = PacketPlatform(id: 1)
    public static let gluon:PacketPlatform = PacketPlatform(id: 2)
}
