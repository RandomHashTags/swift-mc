
public protocol PacketDecodable {
    static func decode<T: GeneralPacket>(from packet: T) throws -> Self
    func packetBytes() throws -> [UInt8]
}