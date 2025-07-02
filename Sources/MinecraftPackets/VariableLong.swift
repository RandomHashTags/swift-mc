
public protocol VariableLong: Codable, PacketCodable {
    var value: Int64 { get }
}