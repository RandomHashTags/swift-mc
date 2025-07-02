
public protocol BlockMovableProtocol: Sendable, ~Copyable {
    /// The reaction of this type when attempting to be moved by a block.
    var blockMoveReaction: any BlockMoveReactionProtocol { get }
}