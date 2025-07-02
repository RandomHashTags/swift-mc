
public protocol Angle: Codable, PacketEncodable {
    var value: Int { get }
}

extension Angle {
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        return [UInt8(value)]
    }
}