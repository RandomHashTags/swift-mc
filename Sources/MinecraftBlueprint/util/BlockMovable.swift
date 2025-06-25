public protocol BlockMovable: Sendable {
    /// The reaction of this type when attempting to be moved by a block.
    var blockMoveReaction: any BlockMoveReaction { get }
}