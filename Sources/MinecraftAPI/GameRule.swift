public protocol GameRule: MinecraftIdentifiable {
    var value: ValueType { get }
}