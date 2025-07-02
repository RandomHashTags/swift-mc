
public protocol GeneratedStructureProtocol: Sendable, ~Copyable {
    var boundary: any BoundaryProtocol { get }
    var structure: any StructureProtocol { get }
    var pieces: [any GeneratedStructurePieceProtocol] { get } // TODO: make Set
}