
public protocol SoundEvent: Sendable, ~Copyable {
    static var defaultRange: Float { get }
    
    var range: Float { get }
}
