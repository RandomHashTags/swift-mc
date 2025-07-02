
public protocol GeneratedStructure: Sendable, ~Copyable {
    var boundary: any Boundary { get }
    var structure: any Structure { get }
    var pieces: [any GeneratedStructurePiece] { get } // TODO: make Set
}