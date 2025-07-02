
public protocol BoundaryProtocol: Sendable, ~Copyable {
    associatedtype BoundaryType: BoundaryTypeProtocol

    var type: BoundaryType { get }

    func contains(_ boundary: any BoundaryProtocol) -> Bool
}