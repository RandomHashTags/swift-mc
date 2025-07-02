
public protocol GeneratedStructureProtocol: Sendable, ~Copyable {
    associatedtype Structure: StructureProtocol
    associatedtype Piece: GeneratedStructurePieceProtocol

    var boundary: any BoundaryProtocol { get }
    var structure: Structure { get }
    var pieces: [Piece] { get } // TODO: make Set
}