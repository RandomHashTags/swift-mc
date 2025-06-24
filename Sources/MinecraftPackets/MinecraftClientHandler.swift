
import Foundation

public protocol MinecraftClientHandler {
    
    associatedtype ProtocolVersion: MinecraftProtocolVersionProtocol
    
    static var platform: PacketPlatform { get }
    
    var protocolVersion: ProtocolVersion { get }
    
    func processPacket() throws
    
    func close()
    
    func sendPacket(_ packet: any ServerPacketProtocol) throws
    func sendPacketData(_ data: Data) throws
}
