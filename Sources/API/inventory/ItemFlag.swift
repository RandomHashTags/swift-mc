
/// Can hide some attributes from item stacks.
public struct ItemFlag: Hashable, Sendable {
    public let id:String
}

// MARK: Create
extension ItemFlag {
    public static func create(
        id: String
    ) -> Self {
        Self(
            id: id
        )
    }
}