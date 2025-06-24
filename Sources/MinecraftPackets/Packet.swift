public protocol Packet: Codable, PacketEncodable {
    associatedtype IDValue: Codable
    
    static func parse(_ packet: any GeneralPacket) throws -> Self
    
    var platform: PacketPlatform { get }
    var category: any PacketCategory { get }
    
    func toGeneral() throws -> any GeneralPacket
}
public extension Packet {
    static func parse(_ packet: any GeneralPacket) throws -> Self {
        throw GeneralPacketError.not_implemented(packet_type: Self.self)
    }
}
