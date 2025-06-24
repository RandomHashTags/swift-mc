public protocol VariableInteger: Codable, PacketCodable {
    var value: Int32 { get }
}