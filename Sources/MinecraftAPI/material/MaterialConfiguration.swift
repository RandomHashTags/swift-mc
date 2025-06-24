public protocol MaterialConfiguration: MinecraftIdentifiable {
    var isOnlyItem: Bool { get }
    var isOnlyBlock: Bool { get }
    var isBlockAndItem: Bool { get }
    
    var item: (any MaterialItemConfiguration)? { get }
    var block: (any MaterialBlockConfiguration)? { get }
}
public extension MaterialConfiguration {
    var isOnlyItem: Bool { item != nil && block == nil }
    var isOnlyBlock: Bool { item == nil && block != nil }
    var isBlockAndItem: Bool { item != nil && block != nil }
}