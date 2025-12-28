
/// A 3-dimensional position in a world.
public struct Location: Sendable {
    /// The 'x' coordinate of this location.
    public var x:Float

    /// The 'y' coordinate of this location.
    public var y:Float

    /// The 'z' coordinate of this location.
    public var z:Float

    public var yaw:Float
    public var pitch:Float
}

// MARK: Whole coordinates
extension Location {
    /// Floored 'x' coordinate of this location.
    public var blockX: Int {
        Int(x)
    }

    /// Floored 'y' coordinate of this location.
    public var blockY: Int {
        Int(y)
    }

    /// Floored 'z' coordinate of this location.
    public var blockZ: Int {
        Int(z)
    }
}