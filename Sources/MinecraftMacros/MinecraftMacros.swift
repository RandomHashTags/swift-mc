import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros
import SwiftDiagnostics

@main
struct MacrosPlugin: CompilerPlugin {
    let providingMacros:[Macro.Type] = [
        MinecraftIdentifiableMacro.self
    ]
}