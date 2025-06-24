public protocol Guardian: Monster {
    /// Measured in ticks.
    var laserChargeDuration: Int { get }
    /// Measured in ticks.
    var durationSinceLaserCharge: Int { get }

    var hasLaser: Bool { get }
    var isElder: Bool { get }
    var isMoving: Bool { get }
}