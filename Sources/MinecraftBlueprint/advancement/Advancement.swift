
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol Advancement: MinecraftIdentifiable, Nameable {    
    var description: String { get }
    var criteria: [String] { get }
    var completed: Date? { get }
}