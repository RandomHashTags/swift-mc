public protocol Steerable: Animal {
    /// Measured in ticks.
    var remainingBoostDuration: Int { get }
    var currentBoostDuration: Int { get }
    var steerMaterial: any Material { get }
    var hasSaddle: Bool { get }
}