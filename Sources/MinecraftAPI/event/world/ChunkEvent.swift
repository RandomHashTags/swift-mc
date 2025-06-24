public protocol ChunkEvent: Event {
    var chunk: any Chunk { get }
    
    init(chunk: any Chunk)
}
