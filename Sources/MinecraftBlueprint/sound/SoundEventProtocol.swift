
public protocol SoundEventProtocol: Sendable, ~Copyable {
    static var defaultRange: Float { get }
    
    var range: Float { get }
}
