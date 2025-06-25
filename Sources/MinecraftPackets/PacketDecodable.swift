
public protocol PacketDecodable: Sendable {
    static func decode<T: GeneralPacket>(from packet: T) throws -> Self

    func packetBytes() throws -> [UInt8]
}