//
//  PacketPlatform.swift
//
//
//  Created by Evan Anderson on 2/4/23.
//

public struct PacketPlatform: Hashable {
    public let id:UInt8

    public static let mojang_java:PacketPlatform = PacketPlatform(id: 0)
    public static let mojang_bedrock:PacketPlatform = PacketPlatform(id: 1)
    public static let gluon:PacketPlatform = PacketPlatform(id: 2)
}
