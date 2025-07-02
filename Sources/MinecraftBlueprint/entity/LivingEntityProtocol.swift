
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol LivingEntityProtocol: Attributable, Damageable, ProjectileSourceProtocol, ~Copyable {
    associatedtype PotionEffect: PotionEffectProtocol

    var canBreatheUnderwater: Bool { get }
    var canPickupItems: Bool { get }
    /// The exempt `Entity` UUIDs where collision between this entity and them will be ignored.
    var collidableExemptions: Set<UUID> { get }

    var hasAI: Bool { get }
    
    var isClimbing: Bool { get }
    var isCollidable: Bool { get }
    var isGliding: Bool { get }
    var isInvisible: Bool { get }
    var isLeashed: Bool { get }
    var isRiptiding: Bool { get }
    var isSleeping: Bool { get }
    var isSwimming: Bool { get }

    var deathSound: (any SoundProtocol)? { get }
    var hurtSound: (any SoundProtocol)? { get }
    func fallDamageSound(fallHeight: Int) -> (any SoundProtocol)?

    var equipment: (any EntityEquipmentProtocol)? { get }
    var eyeHeight: Double { get }
    var eyeLocation: Location { get }
    
    var potionEffects:[PotionEffect] { get } // TODO: make Set
    
    var noActionTicks: Int { get }
    var noDamageTicks: Int { get }
    var noDamageTicksMaximum: Int { get }

    // Measured in ticks.
    var remainingAirDuration: Int { get }
    var airMaximumTicks: Int { get }

    var removeWhenFarAway: Bool { get }

    /// Measured in ticks.
    var arrowCooldown: Int { get }
    var arrowsInBody: [any EntityProtocol] { get } // TODO: make Set
        
    mutating func tickLivingEntity(_ server: any ServerProtocol)
    
    mutating func damageLivingEntity<T: DamageCauseProtocol>(
        cause: T,
        amount: Double
    ) -> DamageResult
}