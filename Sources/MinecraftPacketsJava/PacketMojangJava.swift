
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif
import MinecraftPackets

public protocol PacketMojangJava: Packet, ~Copyable where IDValue == UInt {

    associatedtype GameplayID: PacketGameplayID

    static func parse(
        _ packet: inout GeneralPacketMojang
    ) throws -> Self
    
    static func serverReceived(_ client: any MinecraftClientHandler) throws
    static var packetGameplayID: GameplayID.Type { get }
    
    static var id: GameplayID { get }
    
    func encodedValues() throws -> [(any PacketEncodableMojangJava)?]
}

extension PacketMojangJava {
    @inlinable
    public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
        throw GeneralPacketError.notImplemented(packetType: Self.self)
    }
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
    public func asClientResponse() throws -> Data {
        let packetIdBytes:[UInt8] = try VariableIntegerJava(value: Int32(Self.id.rawValue)).packetBytes()
        let data = try packetBytes()
        
        let length:Int = packetIdBytes.count + data.count
        var bytes = try VariableIntegerJava(value: Int32(length)).packetBytes()
        bytes.append(contentsOf: packetIdBytes)
        bytes.append(contentsOf: data)
        
        print("PacketMojangJava;asClientResponse;id=\(Self.id);packetIdBytes.count=\(packetIdBytes.count);data.count=\(data.count);length=\(length)")
        return Data(bytes)
    }

    @inlinable
    public func toGeneral() throws -> any GeneralPacket {
        try GeneralPacketMojang(bytes: packetBytes())
    }
}
