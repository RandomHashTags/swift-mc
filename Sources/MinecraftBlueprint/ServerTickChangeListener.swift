
public protocol ServerTickChangeListener: Sendable {
    mutating func serverTPSSlowed(
        to tps: Int,
        divisor: Int
    )

    mutating func serverTPSIncreased(
        to tps: Int,
        multiplier: Int
    )
}
