
public protocol LocationProtocol: Sendable, ~Copyable {
    var world: any WorldProtocol { get }
    var x: Double { get }
    var y: Double { get }
    var z: Double { get }
    var yaw: Double { get }
    var pitch: Double { get }
    
    init(
        world: any WorldProtocol,
        x: Double,
        y: Double,
        z: Double,
        yaw: Double,
        pitch: Double
    )
    
    var chunkCoordinates: (x: Int, z: Int) { get }
    
    /// Whether or not the two locations are the same, regardless of `yaw` or `pitch`.
    func isSimilar(_ location: borrowing Self) -> Bool
    
    func isNearby(
        center: any LocationProtocol,
        xRadius: Double,
        yRadius: Double,
        zRadius: Double
    ) -> Bool
    
    /// Gets the distance between two locations, regardless of world.
    func distance(
        to location: any LocationProtocol
    ) -> (x: Double, y: Double, z: Double)
    
    /// Returns self after adding the specified distances to self.
    @discardableResult
    mutating func adding(
        x: Double,
        y: Double,
        z: Double,
        yaw: Double,
        pitch: Double
    ) -> Self
    
    /// Returns a new `Self` by adding the specified distances to this location.
    func advancedBy(x: Double, y: Double, z: Double, yaw: Double, pitch: Double) -> Self
}