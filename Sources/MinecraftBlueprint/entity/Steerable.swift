
public protocol Steerable: AnimalProtocol, ~Copyable {
    /// Measured in ticks.
    var remainingBoostDuration: Int { get }
    var currentBoostDuration: Int { get }
    var steerMaterial: any MaterialProtocol { get }
    var hasSaddle: Bool { get }
}