import Foundation

public protocol BanEntry {
    /// The UUID that banned `target`. `nil` = console
    var bannedBy: UUID? { get }
    var target: String { get }
    var banTime: Date { get }
    var expiration: Date? { get }
    var reason: String? { get }
}
