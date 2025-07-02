
public enum MinecraftProtocolVersion {
}

public protocol MinecraftProtocolVersionProtocol: Codable, RawRepresentable where RawValue == Int {
    var name: String { get }
}

extension MinecraftProtocolVersionProtocol {
    @inlinable
    public var name: String {
        let string = "\(self)".replacing("_", with: ".")
        return String(string[string.index(after: string.startIndex)..<string.endIndex])
    }
}
