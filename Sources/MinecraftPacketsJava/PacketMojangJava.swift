#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif
import MinecraftPackets

public protocol PacketMojangJava: Packet where IDValue == UInt {
    
    associatedtype GameplayID: PacketGameplayID
    
    static func serverReceived(_ client: any MinecraftClientHandler) throws
    static var packetGameplayID: GameplayID.Type { get }
    
    static var id: GameplayID { get }
    
    func encodedValues() throws -> [(any PacketEncodableMojangJava)?]
}

extension PacketMojangJava {
    @inlinable
    public static func serverReceived(_ client: any MinecraftClientHandler) throws {
        //ServerMojang.instance.logger.warning("missing `serverReceived` static function implementation for PacketMojangJava `\(Self.self)` with id \"\(id)\"")
    }
    
    @inlinable
    public var platform: PacketPlatform {
        PacketPlatform.mojangJava
    }
    
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        let encodableBytes:[any PacketEncodableMojangJava] = try encodedValues().compactMap({ $0 })
        return try encodableBytes.flatMap({ try $0.packetBytes() })
    }
    
    // TODO: support compression
    @inlinable
    public func as_client_response() throws -> Data {
        let packet_id_bytes:[UInt8] = try VariableIntegerJava(value: Int32(Self.id.rawValue)).packetBytes()
        let data = try packetBytes()
        
        let length:Int = packet_id_bytes.count + data.count
        var bytes = try VariableIntegerJava(value: Int32(length)).packetBytes()
        bytes.append(contentsOf: packet_id_bytes)
        bytes.append(contentsOf: data)
        
        print("PacketMojangJava;as_client_response;id=\(Self.id);packet_id_bytes.count=\(packet_id_bytes.count);data.count=\(data.count);length=\(length)")
        return Data(bytes)
    }

    @inlinable
    public func toGeneral() throws -> any GeneralPacket {
        try GeneralPacketMojang(bytes: packetBytes())
    }
}
