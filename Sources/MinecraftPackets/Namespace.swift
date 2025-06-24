public protocol Namespace: Codable, LosslessStringConvertible, PacketCodable { // TODO: fix (PacketEncodableMojangJava)
    static func decode<T: GeneralPacket>(from packet: T) throws -> Self
    
    var identifier: Substring { get }
    var value: Substring { get }
}