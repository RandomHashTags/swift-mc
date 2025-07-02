
public protocol GlowSquidProtocol: SquidProtocol, ~Copyable {
    /// Measured in ticks.
    var remainingDarkDuration: Int { get }
}