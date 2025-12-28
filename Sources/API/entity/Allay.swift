
/// An Allay entity.
public struct Allay: Sendable {

    /// Allay's underlying living entity storage.
    public var livingEntity:LivingEntity

    /// Cooldown, measured in ticks, for duplicating the allay.
    public private(set) var duplicationCooldown:UInt

    /// Location of the jukebox the allay is currently dancing to.
    public private(set) var jukebox:Location?

    /// Bit-packed boolean values.
    var flags:Flags.RawValue
}

// MARK: Flags
extension Allay {
    enum Flags: UInt8, Sendable {
        case canDuplicate = 1
        case dancing = 2
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

    /// If the allay can duplicate.
    public var canDuplicate: Bool {
        isFlag(.canDuplicate)
    }

    /// If the allay is currently dancing.
    public var isDancing: Bool {
        isFlag(.dancing)
    }
}

// MARK: Cooldown
extension Allay {
    /// Reset the cooldown for duplication.
    public mutating func resetDuplicationCooldown() {
        duplicationCooldown = 0
    }
}

// MARK: Dancing
extension Allay {
    /// Causes the allay to start dancing with the provided jukebox location.
    public mutating func startDancing(at location: Location) {
        setFlag(.dancing, value: true)
        jukebox = location
    }

    /// Makes the allay stop dancing.
    public mutating func stopDancing() {
        setFlag(.dancing, value: false)
        jukebox = nil
    }
}

// MARK: Duplication
extension Allay {
    /// Duplicate the allay without dance or requiring an item.
    public func duplicate() -> Self {
        let dupe = Self(
            livingEntity: livingEntity,
            duplicationCooldown: duplicationCooldown,
            jukebox: jukebox,
            flags: flags
        )
        // TODO: spawn in world
        // TODO: update duplication cooldown
        return dupe
    }
}