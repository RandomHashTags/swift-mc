
public struct SemanticVersion: Hashable, Comparable {
    public static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        let leftMajor = lhs.major, rightMajor = rhs.major
        let leftMinor = lhs.minor, rightMinor = rhs.minor
        let leftPatch = lhs.patch, rightPatch = rhs.patch
        return leftMajor < rightMajor || leftMajor == rightMajor && (leftMinor < rightMinor || leftMinor == rightMinor && leftPatch < rightPatch)
    }
    
    public let major:Int, minor:Int, patch:Int
    
    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }
    public init(string: String) {
        let values = string.split(separator: ".")
        major = Int(values[0]) ?? 0
        minor = Int(values[1]) ?? 0
        patch = Int(values[2]) ?? 0
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        self = SemanticVersion(string: string)
    }
    
    public var description: String {
        return "\(major).\(minor).\(patch)"
    }
}
