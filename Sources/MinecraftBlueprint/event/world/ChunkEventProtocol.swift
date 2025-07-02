
public protocol ChunkEventProtocol: EventProtocol, ~Copyable {
    var chunk: any ChunkProtocol { get }
    
    init(chunk: any ChunkProtocol)
}