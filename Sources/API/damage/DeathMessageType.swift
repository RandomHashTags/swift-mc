
public struct DeathMessageType: Sendable {
    public let id:String
}

// MARK: Create
extension DeathMessageType {
    public static func create(
        id: String
    ) -> Self {
        Self(
            id: id
        )
    }
}