
public protocol PacketEncodable: Sendable {
    func packetBytes() throws -> [UInt8]
    
    func unwrapOptional<T, R>(_ value: R?, key_path: KeyPath<Self, T>, precondition: String) throws -> R
}

extension PacketEncodable {
    @inlinable
    public func unwrapOptional<T, R>(_ value: R?, key_path: KeyPath<Self, T>, precondition: String) throws -> R {
        guard let value:R = value else {
            throw GeneralPacketError.optional_value_cannot_be_optional(type: Self.self, value: "\(key_path)", precondition: precondition)
        }
        return value
    }
}
