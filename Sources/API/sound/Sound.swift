
public struct Sound: Sendable {
    public let id:String

    public init(
        id: String
    ) {
        self.id = id
    }
}

// MARK: Create
extension Sound {
    public static func create(
        _ id: String
    ) -> Self {
        Self(
            id: id
        )
    }
}