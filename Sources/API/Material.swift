
public struct Material: Sendable {
    public let id:String

    /// Best suitable equipment slot for this material. For most items this will be `hand`.
    public let equipmentSlot:EquipmentSlot

    /// Value representing its resistance to explosions.
    /// 
    /// Used in explosions to calculate whether a block should be broken.
    /// 
    /// - Warning: Only available when `isBlock`.
    public let blastResistance:Float

    /// Value representing the strength of the block.
    /// 
    /// Used to calculate the time required to break each block.
    /// 
    /// - Note: Negative hardness means the block is unbreakable in survial and adventure mode.
    /// 
    /// - Warning: Only available when `isBlock`.
    /// 
    /// - Wiki: https://minecraft.wiki/w/Module:Hardness_values
    public let hardness:Float

    /// Value representing how 'slippery' the block is.
    /// Blocks with higher slipperiness, like `ice` can be slid on further by entities.
    /// 
    /// Most blocks have a default slipperiness of `0.6`.
    /// 
    /// - Warning: Only available when `isBlock`.
    public let slipperiness:Float

    var flags:Flags.RawValue
}

extension Material {
    /// If this material is air (`id` is equal to `minecraft.air`).
    public var isAir: Bool {
        id == "minecraft.air"
    }
}

// MARK: Flags
extension Material {
    enum Flags: UInt16, Sendable {
        case block = 1
        case burnable = 2
        case compostable = 4
        case edible = 8
        case flammable = 16
        case fuel = 32
        case gravity = 64
        case interactable = 128
        case item = 256
        case occludes = 512
        case record = 1024
        case solid = 2048
    }

    private func isFlag(_ flag: Flags) -> Bool {
        flags & flag.rawValue > 0
    }

    /// If this material is affected by gravity.
    public var hasGravity: Bool {
        isFlag(.gravity)
    }

    /// If this material is a placable block.
    public var isBlock: Bool {
        isFlag(.block)
    }

    /// If this material is a block and can burn away.
    public var isBurnable: Bool {
        isBlock && isFlag(.burnable)
    }

    /// If this material is compostable (can be inserted into a composter).
    public var isCompostable: Bool {
        isFlag(.compostable)
    }

    /// If this material is edible.
    public var isEdible: Bool {
        isFlag(.edible)
    }

    /// If this material is a block and can catch fire.
    public var isFlammable: Bool {
        isBlock && isFlag(.flammable)
    }

    /// If this material can be used as fuel in a furnace.
    public var isFuel: Bool {
        isFlag(.fuel)
    }

    /// If this material can be interacted with.
    /// 
    /// - Note: Interactability of some materials may be dependant on their state.
    /// 
    /// - Returns: `true` if there is at least one state in which additional interact handling is performed for the material.
    public var isInteractable: Bool {
        isFlag(.interactable)
    }

    /// If this material is an obtainable item.
    public var isItem: Bool {
        isFlag(.item)
    }

    /// If this material is a block and occludes light in the lighting engine.
    /// 
    /// Most full blocks will occlude light.
    /// Non-full blocks are not occluding (anvils, chests, tall grass, stairs, etc.) nor are specific full blocks such as barriers or spawners which block light despite their texture.
    /// 
    /// An occluding block with have the following effects (list is inconclusive; see full list [here](https://minecraft.wiki/w/Opacity)):
    /// - chests cannot be opened if an occluding block is above it
    /// - mobs cannot spawn inside of occluding blocks
    /// - only occluding blocks can be 'powered'
    public var isOccluding: Bool {
        isBlock && isFlag(.occludes)
    }

    /// If this material is a playable music disk.
    public var isRecord: Bool {
        isFlag(.record)
    }

    /// If this material is a block and solid (can be built upon).
    public var isSolid: Bool {
        isBlock && isFlag(.solid)
    }
}

// MARK: Hashable
extension Material: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}