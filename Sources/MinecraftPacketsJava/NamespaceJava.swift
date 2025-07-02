
import MinecraftPackets

public struct NamespaceJava: Namespace, PacketEncodableMojangJava, PacketDecodableMojangJava { // TODO: fix (PacketEncodableMojangJava)
    public let identifier:Substring
    public let value:Substring

    @inlinable
    public init(identifier: Substring, value: Substring) {
        self.identifier = identifier
        self.value = value
    }

    public init?(_ description: String) {
        let values = description.split(separator: ":")
        guard values.count == 2 else { return nil }
        identifier = values[0]
        value = values[1]
    }

    public var description: String {
        return identifier + ":" + value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        guard let namespace = NamespaceJava(string) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "invalid string: \(string)"))
        }
        self = namespace
    }

    @inlinable
    public func packetBytes() throws -> [UInt8] {
        return try description.packetBytes()
    }
}

// MARK: Decode
extension NamespaceJava {
    @inlinable
    public static func decode<T: GeneralPacket>(from packet: inout T) throws -> Self {
        return try packet.readIdentifier()
    }
}