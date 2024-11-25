//
//  SoundCategory.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol SoundCategory : Identifiable, Hashable, Codable {
    var packetID : Int { get }
}