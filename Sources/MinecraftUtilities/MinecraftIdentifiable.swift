//
//  MinecraftIdentifiable.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol MinecraftIdentifiable : Identifiable where ID == SIMD64<UInt8> {
}