public protocol MaterialConfiguration: MinecraftIdentifiable {
    var isOnlyItem: Bool { get }
    var isOnlyBlock: Bool { get }
    var isBlockAndItem: Bool { get }
    
    var item: (any MaterialItemConfiguration)? { get }
    var block: (any MaterialBlockConfiguration)? { get }
}

extension MaterialConfiguration {
    @inlinable
    public var isOnlyItem: Bool {
        item != nil && block == nil
    }

    @inlinable
    public var isOnlyBlock: Bool {
        item == nil && block != nil
    }

    @inlinable
    public var isBlockAndItem: Bool {
        item != nil && block != nil
    }
}