
public protocol EnchantmentTypeProtocol: MinecraftIdentifiable, Nameable {

    var weight: Int { get }
    var maxLevel: Int { get }

    /// The `EnchantmentType` identifiers this enchantment type conflicts with.
    var conflictsWith: Set<MinecraftIdentifiableID> { get }
}

// TODO: move below to EnchantmentTypeJava file
/*
extension EnchantmentType {
    private static func get(_ id: String, maxLevel: Int) -> EnchantmentType {
        return EnchantmentType(id: "minecraft." + id, name: String(stringLiteral: id), maxLevel: maxLevel)
    }

    public static let aquaAffinity = get("aquaAffinity", maxLevel: 1)
    public static let baneOfArthropods = get("baneOfArthropods", maxLevel: 5)
    public static let bindingCurse = get("bindingCurse", maxLevel: 1)
    public static let blastProtection = get("blastProtection", maxLevel: 4)
    public static let breach = get("breach", maxLevel: 4)
    public static let channeling = get("channeling", maxLevel: 1)
    public static let density = get("density", maxLevel: 5)
    public static let depthStrider = get("depthStrider", maxLevel: 3)
    public static let efficiency = get("efficiency", maxLevel: 5)
    public static let featherFalling = get("featherFalling", maxLevel: 4)
    public static let fireAspect = get("fireAspect", maxLevel: 2)
    public static let fireProtection = get("fireProtection", maxLevel: 4)
    public static let flame = get("flame", maxLevel: 1)
    public static let fortune = get("fortune", maxLevel: 3)
    public static let frostWalker = get("frostWalker", maxLevel: 2)
    public static let impaling = get("impaling", maxLevel: 5)
    public static let infinity = get("infinity", maxLevel: 1)
    public static let knockback = get("knockback", maxLevel: 2)
    public static let looting = get("looting", maxLevel: 3)
    public static let loyalty = get("loyalty", maxLevel: 3)
    public static let luckOfTheSea = get("luckOfTheSea", maxLevel: 3)
    public static let lure = get("lure", maxLevel: 3)
    public static let mending = get("mending", maxLevel: 1)
    public static let multishot = get("multishot", maxLevel: 3)
    public static let piercing = get("piercing", maxLevel: 5)
    public static let power = get("power", maxLevel: 5)
    public static let projectileProtection = get("projectileProtection", maxLevel: 4)
    public static let protection = get("protection", maxLevel: 4)
    public static let punch = get("punch", maxLevel: 2)
    public static let quickCharge = get("quickCharge", maxLevel: 3)
    public static let respiration = get("respiration", maxLevel: 3)
    public static let riptide = get("riptide", maxLevel: 3)
    public static let sharpness = get("sharpness", maxLevel: 5)
    public static let silkTouch = get("silkTouch", maxLevel: 1)
    public static let smite = get("smite", maxLevel: 5)
    public static let soulSpeed = get("soulSpeed", maxLevel: 3)
    public static let sweepingEdge = get("sweepingEdge", maxLevel: 3)
    public static let swiftSneak = get("swiftSneak", maxLevel: 3)
    public static let thorns = get("thorns", maxLevel: 4)
    public static let unbreaking = get("unbreaking", maxLevel: 3)
    public static let vanishingCurse = get("vanishingCurse", maxLevel: 1)
    public static let windBurst = get("windBurst", maxLevel: 3)
}*/