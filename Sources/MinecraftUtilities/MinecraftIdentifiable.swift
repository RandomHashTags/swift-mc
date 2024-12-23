//
//  MinecraftIdentifiable.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public typealias MinecraftIdentifiableID = SIMD64<UInt8>

public protocol MinecraftIdentifiable : Equatable, Identifiable where ID == MinecraftIdentifiableID {
}

public extension MinecraftIdentifiable {
    static func == (left: Self, right: Self) -> Bool {
        return left.id == right.id
    }
    static func != (left: Self, right: Self) -> Bool {
        return left.id != right.id
    }
}