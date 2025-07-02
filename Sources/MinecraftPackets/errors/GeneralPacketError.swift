
public enum GeneralPacketError: Error, CustomStringConvertible {
    case varintTooBig
    case varlongTooBig
    case namespaceValueLengthNotEqual
    case invalidUUID(string: String)
    
    case optionalValueCannotBeOptional(type: Any.Type, value: String, precondition: String)
    
    case notImplemented(packetType: any Packet.Type)
    
    public var description: String {
        switch self {
        case .varintTooBig:
            return "VarInt is too big"
        case .varlongTooBig:
            return "VarLong is too big"
        case .namespaceValueLengthNotEqual:
            return "NamespaceJava value length not equal to 2"
        case .invalidUUID(let string):
            return "Invalid UUID format: " + string
            
        case .optionalValueCannotBeOptional(let type, let value, let precondition):
            return "Optional value `" + value + "` in `\(type)` cannot be nil when " + precondition
            
        case .notImplemented(let packet_type):
            return "`parse(_ packet)` not implemented for `Packet` implementation type: \(packet_type)"
        }
    }
}
