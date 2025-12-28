
public struct Enchantment: Sendable {
    public let id:String
    public let name:String
    public let maxLevel:Int

    public init(
        id: String,
        name: String,
        maxLevel: Int
    ) {
        self.id = id
        self.name = name
        self.maxLevel = maxLevel
    }
}

// MARK: Hashable
extension Enchantment: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: Create
extension Enchantment {
    public static func create(
        _ id: String,
        maxLevel: Int
    ) -> Self {
        Self(
            id: id,
            name: String(stringLiteral: id),
            maxLevel: maxLevel
        )
    }
}