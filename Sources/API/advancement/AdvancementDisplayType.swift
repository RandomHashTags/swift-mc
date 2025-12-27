
public enum AdvancementDisplayType: String, CaseIterable, Sendable {
    /// Challenge icons have a stylised icon frame.
    case challenge

    /// Goal icons have a rounded icon frame.
    case goal

    /// Normal icons have a square icon frame.
    case normal
}

// MARK: ChatColor
extension AdvancementDisplayType {
    /// The `ChatColor` used by Minecraft for this advancement.
    public var chatColor: ChatColor {
        // TODO: fix
        .gold
    }
}