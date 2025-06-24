public protocol WorldBorder {
    var size: Double { get }
    var center: Vector { get }

    /// Measured in blocks.
    var warningDistance: Int { get }
}
