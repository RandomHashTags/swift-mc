
public protocol VariableInteger: PacketCodable, ~Copyable {
    var value: Int32 { get }
}