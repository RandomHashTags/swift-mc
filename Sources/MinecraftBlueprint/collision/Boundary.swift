public protocol Boundary {
    var type: any BoundaryType { get }

    func contains(_ boundary: any Boundary) -> Bool
}
