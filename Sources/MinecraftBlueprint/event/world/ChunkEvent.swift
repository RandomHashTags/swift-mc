
public protocol ChunkEvent: Event, ~Copyable {
    var chunk: any Chunk { get }
    
    init(chunk: any Chunk)
}