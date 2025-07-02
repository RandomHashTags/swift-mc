
public protocol BoundaryProtocol: Sendable, ~Copyable {
    var type: any BoundaryTypeProtocol { get }

    func contains(_ boundary: any BoundaryProtocol) -> Bool
}