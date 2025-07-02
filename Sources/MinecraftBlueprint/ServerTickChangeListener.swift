
public protocol ServerTickChangeListener: Sendable, ~Copyable {
    mutating func serverTPSSlowed(
        to tps: Int,
        divisor: Int
    )

    mutating func serverTPSIncreased(
        to tps: Int,
        multiplier: Int
    )
}
