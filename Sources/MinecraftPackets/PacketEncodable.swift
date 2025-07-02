
public protocol PacketEncodable: Sendable, ~Copyable {
    func packetBytes() throws -> [UInt8]
    
    func unwrapOptional<T, R>(
        _ value: R?,
        key: T,
        precondition: String
    ) throws -> R
}

extension PacketEncodable {
    @inlinable
    public func unwrapOptional<T, R>(_ value: R?, key: T, precondition: String) throws -> R {
        guard let value else {
            throw GeneralPacketError.optionalValueCannotBeOptional(type: Self.self, value: "\(key)", precondition: precondition)
        }
        return value
    }
}
