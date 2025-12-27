
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public struct BanEntry<T: Hashable & Sendable>: Hashable, Sendable {
    /// Creation date of the ban.
    public var created:Date

    /// Expiration date of the ban.
    public var expiration:Date?

    /// Target data of the ban.
    public let target:T

    /// The reason for the ban.
    public var reason:String?

    /// The source of ban such as a player, console, plugin, etc.
    public var source:String?
}