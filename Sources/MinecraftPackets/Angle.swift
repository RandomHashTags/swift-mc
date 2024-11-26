//
//  Angle.swift
//  
//
//  Created by Evan Anderson on 11/25/24.
//

public protocol Angle : Codable, PacketEncodable {
    var value : Int { get }
}
public extension Angle {
    func packetBytes() throws -> [UInt8] {
        return [UInt8(value)]
    }
}