
public protocol PacketDecodable: Sendable, ~Copyable {
    static func decode<T: GeneralPacket>(from packet: inout T) throws -> Self

    func packetBytes() throws -> [UInt8]
}