
public protocol GlowSquid: Squid, ~Copyable {
    /// Measured in ticks.
    var remainingDarkDuration: Int { get }
}