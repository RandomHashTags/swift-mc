
/// Unique attribute.
public struct Attribute: Sendable {
    public let id:String
    public let defaultValue:Double
}

// MARK: Defaults
extension Attribute {
    // TODO: implement default values for the default attributes

    private static func get(
        _ id: String,
        defaultValue: Double = 0 
    ) -> Self {
        Self(
            id: id,
            defaultValue: defaultValue
        )
    }

    /// Armor bonus of an `Entity`.
    public static let armor = get("minecraft.armor")

    /// Armor durability bonus of an `Entity`.
    public static let armorToughness = get("minecraft.armorToughness")
    
    /// Attack damage of an `Entity`.
    public static let attackDamage = get("minecraft.attackDamage")

    /// Attack knockback of an `Entity`.
    public static let attackKnockback = get("minecraft.attackKnockback")
    
    /// Attack speed of an `Entity`.
    public static let attackSpeed = get("minecraft.attackSpeed")

    /// Block break speed of a `Player`.
    public static let blockBreakSpeed = get("minecraft.blockBreakSpeed")

    /// Block reach distance of a `Player`.
    public static let blockInteractionRange = get("minecraft.blockInteractionRange")

    /// Duration, in ticks, an entity remains burning after ignition.
    public static let burningTime = get("minecraft.burningTime")

    /// Distance at which the camera is placed away.
    public static let cameraDistance = get("minecraft.cameraDistance")

    /// Entity reach distance of a `Player`.
    public static let entityInteractionRange = get("minecraft.entityInteractionRange")

    /// Resistance of an `Entity` to knockback from explosions.
    public static let explosionKnockbackResistance = get("minecraft.explosionKnockbackResistance")

    /// Fall damage multiplier of an `Entity`.
    public static let fallDamageMultiplier = get("minecraft.fallDamageMultiplier")
    
    /// Flying speed of an `Entity`.
    public static let flyingSpeed = get("minecraft.flyingSpeed")

    /// Range at which an `Entity` will follow others.
    public static let followRange = get("minecraft.followRange")

    /// Gravity applies to an `Entity`.
    public static let gravity = get("minecraft.gravity")

    /// Strength an `Entity` will jump.
    public static let jumpStrength = get("minecraft.jumpStrength")

    /// Resistance of an `Entity` to knockback.
    public static let knockbackResistance = get("minecraft.knockbackResistance")

    /// Luck bonus of an `Entity`.
    public static let luck = get("minecraft.luck")

    /// Maximum absorption of an `Entity.`
    public static let maxAbsorption = get("minecraft.maxAbsorption")

    /// Maximum health of an `Entity`.
    public static let maxHealth = get("minecraft.maxHealth")

    /// Minving speed for correct tools.
    public static let miningEfficiency = get("minecraft.miningEfficiency")

    /// Movement speed of an `Entity` through difficult terrain.
    public static let movementEfficiency = get("minecraft.movementEfficiency")

    /// Movement speed of an `Entity`.
    public static let movementSpeed = get("minecraft.movementSpeed")

    /// Oxygen use underwater.
    public static let oxygenBonus = get("minecraft.oxygenBonus")

    /// Distance an `Entity` can fall without damage.
    public static let safeFallDistance = get("minecraft.safeFallDistance")

    /// Relative scale of an `Entity`.
    public static let scale = get("minecraft.scale")

    /// Sneaking speed of an `Entity`.
    public static let sneakingSpeed = get("minecraft.sneakingSpeed")

    /// Chance of a `Zombie` to spawn reinforcements.
    public static let spawnReinforcements = get("minecraft.spawnReinforcements")

    /// Height which an `Entity` can walk over.
    public static let stepHeight = get("minecraft.stepHeight")

    /// Mining speed of an `Entity` underwater.
    public static let submergedMiningSpeed = get("minecraft.submergedMiningSpeed")
    
    /// Sweeping damage.
    public static let sweepingDamageRatio = get("minecraft.sweepingDamageRatio")

    /// Range mobs will be tempted by items.
    public static let temptRange = get("minecraft.temptRange")

    /// Movement speed of an `Entity` through water.
    public static let waterMovementEfficiency = get("minecraft.waterMovementEfficiency")

    /// Waypoint transmission range.
    public static let waypointTransmitRange = get("minecraft.waypointTransmitRange")
    
    /// Waypoint receive range.
    public static let waypointReceiveRange = get("minecraft.waypointReceiveRange")
}