
public protocol Packet: PacketEncodable, ~Copyable {
    associatedtype IDValue: Codable
    
    var platform: PacketPlatform { get }
    var category: any PacketCategory { get }
    
    func toGeneral() throws -> any GeneralPacket
}