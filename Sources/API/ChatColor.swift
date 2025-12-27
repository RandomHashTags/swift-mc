
public enum ChatColor: String, CaseIterable, Sendable {
    /// The special character that prefixes all chat color codes.
    case specialChar

    case bold
    case italic
    case magic
    case reset
    case strikethrough
    case underline

    case aqua
    case black
    case blue
    case darkAqua
    case darkBlue
    case darkGray
    case darkGreen
    case darkPurple
    case darkRed
    case gold
    case gray
    case green
    case lightPurple
    case red
    case white
    case yellow
}

// MARK: Char
extension ChatColor {
    // TODO: support
}

// MARK: Is format
extension ChatColor {
    /// Whether this is a format code.
    public var isFormat: Bool {
        switch self {
        case .specialChar, .bold, .italic, .magic, .reset, .strikethrough, .underline:
            true
        default:
            false
        }
    }
}

// MARK: Is color
extension ChatColor {
    /// Whether this is a color code.
    public var isColor: Bool {
        !isFormat
    }
}

// MARK: Strip
extension ChatColor {
    /// Strips the given input of all color codes.
    /// 
    /// - Returns: A copy of the input excluding any coloring.
    public static func strip(_ input: String) -> String {
        // TODO: implement
        return input
    }
}

// MARK: Translate
extension ChatColor {
    /// Copies and translates the input using a color code character.
    /// 
    /// - Parameters:
    ///   - char: Color code character to replace. Example: `&`.
    ///   - input: Text you want to translate using the given color code.
    /// 
    /// - Warning: The color code character will only be replaced if it is immediately followed by 0-9, A-F, a-f, K-O, k-o, R or r.
    public static func translate(
        char: Character = "&",
        input: String
    ) -> String {
        // TODO: implement
        return input
    }
}