//
//  NamespaceProtocol.swift
//  
//
//  Created by Evan Anderson on 8/4/23.
//

public protocol NamespaceProtocol : Hashable, Codable, LosslessStringConvertible, PacketEncodable, PacketDecodable { // TODO: fix (PacketEncodableMojangJava)
    static func decode(from packet: any GeneralPacket) throws -> Self
    
    var identifier : Substring { get }
    var value : Substring { get }
}