
public protocol MaterialBlockGrowableConfiguration: Sendable, ~Copyable {
    var maximumAge: UInt8 { get }
    var minimumLightLevelToGrow: UInt8 { get }
}
