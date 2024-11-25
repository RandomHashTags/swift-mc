//
//  PacketReceiver.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import Packets

public protocol PacketReceiver {
    func sendPacket<T : Packet>(_ packet: T) throws
}
