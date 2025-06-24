
public enum MinecraftProtocolVersion {
}

public protocol MinecraftProtocolVersionProtocol: Codable, RawRepresentable where RawValue == Int {
    var name: String { get }
}
public extension MinecraftProtocolVersionProtocol {
    var name: String {
        let string:String = "\(self)".replacing("_", with: ".")
        return String(string[string.index(after: string.startIndex)..<string.endIndex])
    }
}
