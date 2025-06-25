public typealias MinecraftIdentifiableID = SIMD64<UInt8>

public protocol MinecraftIdentifiable: Equatable, Identifiable, Sendable where ID == MinecraftIdentifiableID {
}

extension MinecraftIdentifiable {
    @inlinable
    public static func == (left: Self, right: Self) -> Bool {
        left.id == right.id
    }

    @inlinable
    public static func != (left: Self, right: Self) -> Bool {
        left.id != right.id
    }
}