
/// Face of a block.
public enum BlockFace: String, CaseIterable, Sendable {
    case down
    case east
    case eastNorthEast
    case eastSouthEast
    case north
    case northEast
    case northNorthEast
    case northNorthWest
    case northWest
    case `self`
    case south
    case southEast
    case southSouthEast
    case southSouthWest
    case southWest
    case up
    case west
    case westNorthWest
    case westSouthWest
}

extension BlockFace {
    /// If this face is aligned with one of the unit axes in 3D Catesian space (north, east, south, west, up, down)
    public var isCartesian: Bool {
        switch self {
        case .north, .east, .south, .west, .up, .down:
            true
        default:
            false
        }
    }

    /// Opposite face of the current face.
    public var oppositeFace: Self {
        switch self {
        case .down: .up
        case .east: .west
        case .eastNorthEast: .westSouthWest
        case .eastSouthEast: .westNorthWest
        case .north: .south
        case .northEast: .southWest
        case .northNorthEast: .southSouthWest
        case .northNorthWest: .southSouthEast
        case .northWest: .southEast
        case .self: .self
        case .south: .north
        case .southEast: .northWest
        case .southSouthEast: .northNorthWest
        case .southSouthWest: .northNorthEast
        case .southWest: .northEast
        case .up: .down
        case .west: .east
        case .westNorthWest: .eastSouthEast
        case .westSouthWest: .eastNorthEast
        }
    }
}