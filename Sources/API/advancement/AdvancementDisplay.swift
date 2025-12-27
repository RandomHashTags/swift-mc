
/// Information about how an advancement is displayed.
public struct AdvancementDisplay: Sendable {
    /// The X position of the advancement in the advancement screen.
    public let x:Float

    /// The Y position of the advancement in the advancement screen.
    public let y:Float

    /// Display type for the advancement.
    public let type:AdvancementDisplayType

    /// Bit-packed boolean values.
    var _flags:Flags.RawValue

    /// The `ItemStack` that is shown for the advancement.
    //public let icon:ItemStack // TODO: support

    /// Title of the advancement without color codes.
    public let title:String

    /// Description of the advancement without color codes.
    public let description:String
}

// MARK: Flags
extension AdvancementDisplay {
    enum Flags: UInt8, Sendable {
        case shouldShowToast = 1
        case shouldAnnounceChat = 2
        case isHidden = 4
    }

    func isFlag(_ flag: Flags) -> Bool {
        _flags & flag.rawValue != 0
    }

    /// Whether to show a toast to the player when the advancement is completed.
    public var shouldShowToast: Bool {
        isFlag(.shouldShowToast)
    }

    /// Whether to announce in the chat when the advancement is completed.
    public var shouldAnnounceChat: Bool {
        isFlag(.shouldAnnounceChat)
    }

    /// Whether to hide the advancement and all its children from the advancement screen until the advancement has been completed.
    /// Has no effect on root advancements, but still affects all their children.
    public var isHidden: Bool {
        isFlag(.isHidden)
    }
}