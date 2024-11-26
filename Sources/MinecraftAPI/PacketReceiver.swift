//
//  PacketReceiver.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import MinecraftPackets

public protocol PacketReceiver {
    func sendPacket(_ packet: any Packet) throws
}
