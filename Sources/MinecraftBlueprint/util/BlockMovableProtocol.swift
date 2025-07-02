
public protocol BlockMovableProtocol: Sendable, ~Copyable {
    associatedtype BlockMoveReaction: BlockMoveReactionProtocol

    /// The reaction of this type when attempting to be moved by a block.
    var blockMoveReaction: BlockMoveReaction { get }
}