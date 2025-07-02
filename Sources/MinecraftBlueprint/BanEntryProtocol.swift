
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol BanEntryProtocol: Sendable, ~Copyable {
    /// The UUID that banned `target`. `nil` = console
    var bannedBy: UUID? { get }
    var target: String { get }
    var banTime: Date { get }
    var expiration: Date? { get }
    var reason: String? { get }
}
