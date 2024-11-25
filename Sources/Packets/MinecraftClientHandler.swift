//
//  MinecraftClientHandler.swift
//
//
//  Created by Evan Anderson on 11/25/23.
//

import Foundation

public protocol MinecraftClientHandler : AnyObject, Hashable {
    
    associatedtype ProtocolVersion : MinecraftProtocolVersionProtocol
    
    static var platform : PacketPlatform { get }
    
    var protocolVersion : ProtocolVersion { get }
    
    func processPacket() throws
    
    func close()
    
    func sendPacketData(_ data: Data) throws
}
