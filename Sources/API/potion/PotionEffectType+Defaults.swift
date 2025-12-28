
extension PotionEffectType {
    /// Increases the maximum health of an entity with health that cannot be regenerated but is refilled every 30 seconds.
    public static let absorption = create("minecraft.absorption")

    /// Triggers an ominous event when the player enters a village or trial chamber.
    public static let badOmen = create("minecraft.badOmen")

    /// Blinds an entity.
    public static let blindness = create("minecraft.blindness")

    /// Allows breathing underwater.
    public static let breathOfTheNautilus = create("minecraft.breathOfTheNautilus")

    /// Effects granted by a nearby conduit.
    public static let conduitPower = create("minecraft.conduitPower")

    /// Causes the player's vision to dim occasionally.
    public static let darkness = create("minecraft.darkness")

    /// Increases underwater movement speed.
    public static let dolphinsGrace = create("minecraft.dolphinsGrace")

    /// Become immune to fire damage.
    public static let fireResistance = create("minecraft.fireResistance")

    /// Outlines the entity so that it can be seen from afar.
    public static let glowing = create("minecraft.glowing")

    /// Increases block breaking speed.
    public static let haste = create("minecraft.haste")

    /// Increases the maximum health of an entity.
    public static let healthBoost = create("minecraft.healthBoost")

    /// Reduces the cost of villager trades.
    public static let heroOfTheVillage = create("minecraft.heroOfTheVillage")

    /// Increases hunger, reducing food faster.
    public static let hunger = create("minecraft.hunger")

    /// Chance of spawning silverfish when hurt.
    public static let infested = create("minecraft.infested")

    /// Hurts an entity.
    public static let instantDamage = create("minecraft.instantDamage", isInstant: true)

    /// Heals an entity.
    public static let instantHealth = create("minecraft.instantHealth", isInstant: true)

    /// Grants invisibility.
    public static let invisibility = create("minecraft.invisibility")

    /// Increases jump height.
    public static let jumpBoost = create("minecraft.jumpBoost")

    /// Causes the entity to float into the air.
    public static let levitation = create("minecraft.levitation")

    /// Increases luck.
    public static let luck = create("minecraft.luck")

    /// Decreases block breaking speed.
    public static let miningFatigue = create("minecraft.miningFatigue")

    /// Warps vision on the client.
    public static let nausea = create("minecraft.nausea")

    /// Allows an entity to see in the dark.
    public static let nightVision = create("minecraft.nightVision")

    /// Causes slimes to spawn upon death.
    public static let oozing = create("minecraft.oozing")

    /// Deals damage to an entity over time.
    public static let poison = create("minecraft.poison")

    /// Triggers a raid when a plaer enters a village.
    public static let raidOmen = create("minecraft.raidOmen")

    /// Regenerates health over time.
    public static let regeneration = create("minecraft.regeneration")

    /// Decreases damage received.
    public static let resistance = create("minecraft.resistance")

    /// Increases the food level of an entity over time.
    public static let saturation = create("minecraft.saturation")

    /// Slows entity fall rate.
    public static let slowFalling = create("minecraft.slowFalling")

    /// Decreases movement speed.
    public static let slowness = create("minecraft.slowness")

    /// Increases damage dealt.
    public static let strength = create("minecraft.strength")

    /// causes trial spawners to become ominous.
    public static let trialOmen = create("minecraft.trailOmen")

    /// Decreases luck.
    public static let unluck = create("minecraft.unluck")

    /// Allows breathing underwater.
    public static let waterBreathing = create("minecraft.waterBreathing")

    /// Decreases damage dealt.
    public static let weakness = create("minecraft.weakness")

    /// Creates cobwebs upon death.
    public static let weaving = create("minecraft.weaving")

    /// Emits a wind burst upon death.
    public static let windCharged = create("minecraft.windCharged")

    /// Deals damage to over time and gives the health to the shooter.
    public static let wither = create("minecraft.wither")
}