
// TODO: finish
extension Material {

    // TODO: fix default values
    private static func get(
        _ id: String,
        equipmentSlot: EquipmentSlot = .hand,
        blastResistance: Float = 0,
        hardness: Float = 0,
        slipperiness: Float = 0.6,
        flags: Flags.RawValue = 0
    ) -> Self {
        Self(
            id: id,
            equipmentSlot: equipmentSlot,
            blastResistance: blastResistance,
            hardness: hardness,
            slipperiness: slipperiness,
            flags: flags
        )
    }
}

// MARK: A
extension Material {
    public static let acaciaBoat = get("minecraft.acaciaBoat")
    public static let acaciaButton = get("minecraft.acaciaButton")
    public static let acaciaChestBoat = get("minecraft.acaciaChestBoat")
    public static let acaciaDoor = get("minecraft.acaciaDoor")
    public static let acaciaFence = get("minecraft.acaciaFence")
    public static let acaciaFenceGate = get("minecraft.acaciaFenceGate")
    public static let acaciaHangingSign = get("minecraft.acaciaHangingSign")
    public static let acaciaLeaves = get("minecraft.acaciaLeaves")
    public static let acaciaLog = get("minecraft.acaciaLog")
    public static let acaciaPlanks = get("minecraft.acaciaPlanks")
    public static let acaciaPressurePlate = get("minecraft.acaciaPressurePlate")
    public static let acaciaSapling = get("minecraft.acaciaSapling")
    public static let acaciaShelf = get("minecraft.acaciaShelf")
    public static let acaciaSign = get("minecraft.acaciaSign")
    public static let acaciaSlab = get("minecraft.acaciaSlab")
    public static let acaciaStairs = get("minecraft.acaciaStairs")
    public static let acaciaTrapdoor = get("minecraft.acaciaTrapdoor")
    public static let acaciaWallHangingSign = get("minecraft.acaciaWallHangingSign")
    public static let acaciaWallSign = get("minecraft.acaciaWallSign")
    public static let acaciaWood = get("minecraft.acaciaWood")

    public static let activatorRail = get("minecraft.activatorRail")
    public static let air = get("minecraft.air")
    public static let allaySpawnEgg = get("minecraft.allaySpawnEgg")
    public static let allium = get("minecraft.allium")
    public static let amethystBlock = get("minecraft.amethystBlock")
    public static let amethystCluster = get("minecraft.amethystCluster")
    public static let amethystShard = get("minecraft.amethystShard")
    public static let ancientDebris = get("minecraft.ancientDebris")
    public static let andesite = get("minecraft.andesite")
    public static let andesiteSlab = get("minecraft.andesiteSlab")
    public static let andesiteStairs = get("minecraft.andesiteStairs")
    public static let andesiteWall = get("minecraft.andesiteWall")
    public static let anglerPotterySherd = get("minecraft.anglerPotterySherd")
    public static let anvil = get("minecraft.anvil")
    public static let apple = get("minecraft.apple")
    public static let archeryPotterySherd = get("minecraft.archeryPotterySherd")
    public static let armadilloScute = get("minecraft.armadilloScute")
    public static let armadilloSpawnEgg = get("minecraft.armadilloSpawnEgg")
    public static let armorStand = get("minecraft.armorStand")
    public static let armsUpPotterySherd = get("minecraft.armsUpPotterySherd")
    public static let arrow = get("minecraft.arrow")
    public static let attachedMelonStem = get("minecraft.attachedMelonStem")
    public static let attachedPumpkinStem = get("minecraft.attachedPumpkinStem")
    public static let axolotlBucket = get("minecraft.axolotlBucket")
    public static let axolotlSpawnEgg = get("minecraft.axolotlSpawnEgg")
    public static let azalea = get("minecraft.azalea")
    public static let azaleaLeaves = get("minecraft.azaleaLeaves")
    public static let azureBluet = get("minecraft.azureBluet")
}

// MARK: B

// MARK: C