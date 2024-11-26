//
//  PacketMojangJava.swift
//  
//
//  Created by Evan Anderson on 8/4/23.
//

import Foundation
import MinecraftPackets

public protocol PacketMojangJava : Packet where IDValue == UInt {
    
    associatedtype GameplayID : PacketGameplayID
    
    static func serverReceived(_ client: any MinecraftClientHandler) throws
    static var packetGameplayID : GameplayID.Type { get }
    
    static var id : GameplayID { get }
    
    func encodedValues() throws -> [(any PacketEncodableMojangJava)?]
}

public extension PacketMojangJava {
    static func serverReceived(_ client: any MinecraftClientHandler) throws {
        //ServerMojang.instance.logger.warning("missing `serverReceived` static function implementation for PacketMojangJava `\(Self.self)` with id \"\(id)\"")
    }
    
    var platform : PacketPlatform {
        return PacketPlatform.mojang_java
    }
    
    func packetBytes() throws -> [UInt8] {
        let encodable_bytes:[any PacketEncodableMojangJava] = try encodedValues().compactMap({ $0 })
        return try encodable_bytes.flatMap({ try $0.packetBytes() })
    }
    
    // TODO: support compression
    func as_client_response() throws -> Data {
        let packet_id_bytes:[UInt8] = try VariableIntegerJava(value: Int32(Self.id.rawValue)).packetBytes()
        let data:[UInt8] = try packetBytes()
        
        let length:Int = packet_id_bytes.count + data.count
        var bytes:[UInt8] = try VariableIntegerJava(value: Int32(length)).packetBytes()
        bytes.append(contentsOf: packet_id_bytes)
        bytes.append(contentsOf: data)
        
        print("PacketMojangJava;as_client_response;id=\(Self.id);packet_id_bytes.count=\(packet_id_bytes.count);data.count=\(data.count);length=\(length)")
        return Data(bytes)
    }

    func toGeneral() throws -> any GeneralPacket {
        return try GeneralPacketMojang(bytes: packetBytes())
    }
}
