//
//  MinecraftUtilities.swift
//  
//
//  Created by Evan Anderson on 11/28/24.
//

@freestanding(expression)
public macro identifiable(_ value: String) -> SIMD64<UInt8> = #externalMacro(module: "MinecraftMacros", type: "MinecraftIdentifiableMacro")