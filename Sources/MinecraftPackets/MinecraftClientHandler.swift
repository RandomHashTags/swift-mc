
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol MinecraftClientHandler {
    
    associatedtype ProtocolVersion: MinecraftProtocolVersionProtocol
    
    static var platform: PacketPlatform { get }
    
    var protocolVersion: ProtocolVersion { get }
    
    func processPacket() throws
    
    func close()
    
    func sendPacket(_ packet: any ServerPacketProtocol) throws
    func sendPacketData(_ data: Data) throws
}
