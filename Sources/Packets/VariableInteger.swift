//
//  VariableInteger.swift
//  
//
//  Created by Evan Anderson on 11/25/24.
//

public protocol VariableInteger : Codable, PacketCodable {
    var value : Int32 { get }
}