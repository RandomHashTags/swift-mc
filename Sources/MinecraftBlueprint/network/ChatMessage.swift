
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol ChatMessage: MinecraftIdentifiable {
    var timestamp: Date { get }
    var sender: any CommandSender { get }
    var receiver: String? { get }
    var message: String { get }
}
