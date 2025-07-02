
public protocol Boundary: Sendable, ~Copyable {
    var type: any BoundaryType { get }

    func contains(_ boundary: any Boundary) -> Bool
}