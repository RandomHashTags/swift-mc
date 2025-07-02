
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol ChatMessageProtocol: MinecraftIdentifiable {
    var timestamp: Date { get }
    var sender: any CommandSenderProtocol { get }
    var receiver: String? { get }
    var message: String { get }
}