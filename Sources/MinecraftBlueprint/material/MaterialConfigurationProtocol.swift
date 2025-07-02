
public protocol MaterialConfigurationProtocol: MinecraftIdentifiable {
    var isOnlyItem: Bool { get }
    var isOnlyBlock: Bool { get }
    var isBlockAndItem: Bool { get }
    
    var item: (any MaterialItemConfigurationProtocol)? { get }
    var block: (any MaterialBlockConfigurationProtocol)? { get }
}

extension MaterialConfigurationProtocol {
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