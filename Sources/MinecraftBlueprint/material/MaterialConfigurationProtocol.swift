
public protocol MaterialConfigurationProtocol: MinecraftIdentifiable {
    associatedtype BlockConfiguration: MaterialBlockConfigurationProtocol
    associatedtype ItemConfiguration: MaterialItemConfigurationProtocol

    var isOnlyItem: Bool { get }
    var isOnlyBlock: Bool { get }
    var isBlockAndItem: Bool { get }
    
    var item: ItemConfiguration? { get }
    var block: BlockConfiguration? { get }
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