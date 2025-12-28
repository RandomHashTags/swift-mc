
/// Entity that has health and can take damage.
public struct Damageable: Sendable {
    /// Damageable's underlying entity storage.
    public var entity:Entity

    /// Current health for this damageable.
    public var health:Double {
        didSet {
            health = max(0, oldValue)
        }
    }
    public var absorptionAmount:Double
}

// MARK: Damage
extension Damageable {
    /// Deals the specified amount of damage to this damageable.
    /// 
    /// - Parameters:
    ///   - amount: Amount of damage to deal
    public mutating func damage(amount: Double) {
        health -= amount
        if health > 0 {
            health = 0
        }
    }
}