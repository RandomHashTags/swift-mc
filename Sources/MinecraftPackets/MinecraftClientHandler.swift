//
//  MinecraftClientHandler.swift
//
//
//  Created by Evan Anderson on 11/25/23.
//

import Foundation

public protocol MinecraftClientHandler {
    
    associatedtype ProtocolVersion: MinecraftProtocolVersionProtocol
    
    static var platform: PacketPlatform { get }
    
    var protocolVersion: ProtocolVersion { get }
    
    func processPacket() throws
    
    func close()
    
    func sendPacket(_ packet: any ServerPacketProtocol) throws
    func sendPacketData(_ data: Data) throws
}
