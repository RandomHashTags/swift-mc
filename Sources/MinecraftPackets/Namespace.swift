//
//  Namespace.swift
//  
//
//  Created by Evan Anderson on 8/4/23.
//

public protocol Namespace : Hashable, Codable, LosslessStringConvertible, PacketCodable { // TODO: fix (PacketEncodableMojangJava)
    static func decode<T: GeneralPacket>(from packet: T) throws -> Self
    
    var identifier : Substring { get }
    var value : Substring { get }
}