
public struct ItemRarity: Sendable {
    public let id:String
}

// MARK: Create
extension ItemRarity {
    public static func create(
        _ id: String
    ) -> Self {
        Self(
            id: id
        )
    }
}