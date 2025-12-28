
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

/// A base entity in the world.
public struct Entity: Sendable {
    /// Persistent unique id for the entity.
    public let uniqueId:UUID

    /// Unique id for the entity.
    public let entityId:UInt64

    /// Distance the entity has fallen.
    public var fallDistance:Float

    /// Entity's current fire ticks (remaining ticks the entity stays on fire).
    public var fireTicks:Int

    /// Entity's current freeze ticks (amount of ticks the entity has been freezing).
    public var freezeTicks:Int

    /// Entity's current location.
    public private(set) var location:Location

    /// Entity's maximum fire ticks.
    public var maxFireTicks:Int

    /// Entity's maximum freeze ticks.
    public var maxFreezeTicks:Int

    /// Entity's current pose.
    public private(set) var pose:Pose

    /// Entity's spawn category.
    public let spawnCategory:SpawnCategory


    // MARK: Dimensions

    /// Entity's current height.
    public private(set) var height:Double

    /// Entity's current width.
    public private(set) var width:Double


    // MARK: Sounds

    /// The sound this entity makes while swimming.
    /// For most entities this is `minecraft.entity.generic.splash`.
    public let soundSwim:Sound

    /// The sound this entity makes when splashing in water.
    /// For most entities this is `minecraft.entity.generic.splash`.
    public let soundSwimSplash:Sound

    /// The sound the entity makes when splashing in water at high speeds.
    /// For most entities this is `minecraft.entity.generic.splash`.
    public let soundSwimHighSpeedSplash:Sound


    // MARK: Other

    /// List of passengers of this vehicle.
    public var passengers:[Entity]

    var flags:Flags.RawValue
}

// MARK: Flags
extension Entity {
    enum Flags: UInt16, Sendable {
        case gravity = 1
        case customNameVisible = 2
        case dead = 4
        case glowing = 8
        case invulnerable = 16
        case inWater = 32
        case onGround = 64
        case persistent = 128
        case silent = 256
        case visibleByDefault = 512
    }

    private func isFlag(_ flag: Flags) -> Bool {
        flags & flag.rawValue > 0
    }
    private mutating func setFlag(_ flag: Flags, value: Bool) {
        if value {
            flags |= flag.rawValue
        } else {
            flags &= ~flag.rawValue
        }
    }

    /// If gravity applies to this entity.
    public var hasGravity: Bool {
        isFlag(.gravity)
    }

    /// If the entity's custom name is displayed client side.
    public var isCustomNameVisible: Bool {
        isFlag(.customNameVisible)
    }

    /// If the entity has been marked for removal.
    public var isDead: Bool {
        isFlag(.dead)
    }

    /// If the entity is glowing.
    public var isGlowing: Bool {
        isFlag(.glowing)
    }

    /// If the entity is invulnerable.
    public var isInvulnerable: Bool {
        isFlag(.invulnerable)
    }

    /// If the entity is in water.
    public var isInWater: Bool {
        isFlag(.inWater)
    }

    /// If the entity is supported by a block.
    public var isOnGround: Bool {
        isFlag(.onGround)
    }

    /// If the entity gets persisted.
    public var isPersistent: Bool {
        isFlag(.persistent)
    }

    /// If the entity is silent.
    public var isSilent: Bool {
        isFlag(.silent)
    }

    /// If the entity is visible by default.
    public var isVisibleByDefault: Bool {
        isFlag(.visibleByDefault)
    }
}

// MARK: Booleans
extension Entity {
    /// If the entity doesn't have any passengers.
    public var isEmpty: Bool {
        passengers.isEmpty
    }

    /// If the entity is fully frozen (`freezeTicks` is greater than `maxFreezeTicks`).
    public var isFrozen: Bool {
        freezeTicks > maxFreezeTicks
    }

    /// If the entity is alive, in a world and was not despawned.
    public var isValid: Bool {
        !isFlag(.dead) // TODO: finish
    }
}

// MARK: Remove
extension Entity {
    /// Marks the entity for removal.
    public mutating func remove() {
        setFlag(.dead, value: true)
    }
}

// MARK: Teleport
extension Entity {
    /// Teleports the entity to the target entity.
    /// 
    /// - Note: If the entity is riding a vehicle, it will be dismounted prior to teleportation.
    /// 
    /// - Returns: If the teleport was successful.
    public mutating func teleport(to entity: Entity) -> Bool {
        // TODO: finish
        location = entity.location
        return true
    }
}