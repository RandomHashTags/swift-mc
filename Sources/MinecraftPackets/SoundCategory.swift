//
//  SoundCategory.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol SoundCategory : Codable, Hashable, Identifiable where ID == String {
    var packetID : Int { get }
}