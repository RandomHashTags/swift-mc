//
//  MinecraftIdentifiable.swift
//  
//
//  Created by Evan Anderson on 11/28/24.
//

import SwiftSyntax
import SwiftSyntaxMacros
import SwiftDiagnostics

enum MinecraftIdentifiableMacro: ExpressionMacro {
    static func expansion(of node: some FreestandingMacroExpansionSyntax, in context: some MacroExpansionContext) throws -> ExprSyntax {
        let string:String = "\(node.arguments.first!.expression.as(StringLiteralExprSyntax.self)!.segments)"
        var identifiable:SIMD64<UInt8> = .zero
        for i in 0..<string.count {
            identifiable[i] = string[string.index(string.startIndex, offsetBy: i)].asciiValue ?? 0
        }
        return "\(raw: identifiable)"
    }
}