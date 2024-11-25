//
//  MinecraftMacros.swift
//  
//
//  Created by Evan Anderson on 7/7/24.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros
import SwiftDiagnostics

@main
struct MacrosPlugin : CompilerPlugin {
    let providingMacros:[Macro.Type] = [
        MinecraftPlugin.self,
        MinecraftCommand.self
    ]
}