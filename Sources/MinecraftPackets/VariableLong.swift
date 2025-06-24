//
//  VariableLong.swift
//  
//
//  Created by Evan Anderson on 11/25/24.
//

public protocol VariableLong: Codable, PacketCodable {
    var value: Int64 { get }
}