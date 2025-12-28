
/// A living entity such as an animal, monster or player.
public struct LivingEntity: Sendable {

    /// The living entity's underlying damageable storage.
    public var damageable:Damageable

    /// Maximum number of ticks the entity has of air.
    public var maximumAir:Int

    /// Maximum number of ticks the entity becomes immune to damage after receiving damage.
    public var maximumNoDamageTicks:Int

    /// Number of ticks the entity has performed no action.
    public var noActionTicks:Int

    /// Remaining number of ticks the entity is immune from damage.
    public var noDamageTicks:Int

    /// Remaining number of ticks the entity has of air.
    public var remainingAir:Int

    // MARK: Sounds
    /// Sound the entity will make on death.
    public let soundDeath:Sound?

    /// Sound the entity will make when falling from a large height.
    public let soundFallDamageBig:Sound

    /// Sound the entity will make when falling from a small height.
    public let soundFallDamageSmall:Sound

    /// Sound the entity will make when damaged.
    public let soundHurt:Sound?

    // MARK: Other
    /// Bit-packed boolean values.
    var flags:Flags.RawValue
}

// MARK: Flags
extension LivingEntity {
    enum Flags: UInt16, Sendable {
        case ai = 1
        case climbing = 2
        case collidable = 4
        case gliding = 8
        case invisible = 16
        case riptiding = 32
        case sleeping = 64
        case swimming = 128
        case pickupItems = 256
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

    /// If the entity has AI.
    public var hasAI: Bool {
        get {
            isFlag(.ai)
        }
        set {
            setFlag(.ai, value: newValue)
        }
    }

    /// If the entity is currently climbing.
    public var isClimbing: Bool {
        isFlag(.climbing)
    }

    /// If the entity is currently subject to collisions with other entities.
    public var isCollidable: Bool {
        get {
            isFlag(.collidable)
        }
        set {
            setFlag(.collidable, value: newValue)
        }
    }

    /// If the entity is currently gliding (such as using an Elytra).
    public var isGliding: Bool {
        get {
            isFlag(.gliding)
        }
        set {
            setFlag(.gliding, value: newValue)
        }
    }

    /// If the entity is currently invisible.
    public var isInvisible: Bool {
        get {
            isFlag(.invisible)
        }
        set {
            setFlag(.invisible, value: newValue)
        }
    }

    /// If the entity is currently riptiding.
    public var isRiptiding: Bool {
        get {
            isFlag(.riptiding)
        }
        set {
            setFlag(.riptiding, value: newValue)
        }
    }

    /// If the entity is currently sleeping/slumbering.
    public var isSleeping: Bool {
        isFlag(.sleeping)
    }

    /// If the entity is currentky swimming.
    public var isSwimming: Bool {
        get {
            isFlag(.swimming)
        }
        set {
            setFlag(.swimming, value: newValue)
        }
    }

    /// If the entity can currently pick up items.
    public var canPickupItems: Bool {
        get {
            isFlag(.pickupItems)
        }
        set {
            setFlag(.pickupItems, value: newValue)
        }
    }
}