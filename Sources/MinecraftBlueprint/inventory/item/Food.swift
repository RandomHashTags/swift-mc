
public protocol Food: Sendable, ~Copyable {
    /// The food restored when this item is consumed.
    var nutrition: Int { get }

    /// The saturation restored when this item is consumed.
    var saturation: Float { get }
}