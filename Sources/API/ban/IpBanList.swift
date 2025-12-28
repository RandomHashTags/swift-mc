
/// List of banned IP addresses.
public struct IpBanList: Sendable {
    public typealias Entry = BanEntry<String>

    public var entries:Set<Entry>
}

extension IpBanList {
    /// - Returns: Whether the specified IP is currently banned.
    public func isBanned(_ ip: Entry) -> Bool {
        entries.contains(ip)
    }

    /// Removes the specified IP from the ban list.
    public mutating func pardon(_ ip: Entry) {
        entries.remove(ip)
    }
}