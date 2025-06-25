#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol Entity: BlockMovable, CustomNameable, DisplayNameable, Tickable {
    var id: UInt64 { get }
    var uuid: UUID { get }
    var type: any EntityType { get }
    
    var ticksLived: UInt64 { get }
    
    var boundaries: [any Boundary] { get }

    /// The current location of this entity.
    var location: any Location { get }

    /// The current velocity of this entity.
    var velocity: Vector { get }

    /// The total fall distance of this entity, measured in blocks.
    var fallDistance: Float { get }
    
    var isGlowing: Bool { get }
    var isOnFire: Bool { get }
    var isOnGround: Bool { get }
    
    /// The height of this entity, measured in blocks.
    var height: Double { get }
    
    var fireTicks: Int { get }
    var fireTicksMaximum: Int { get }
    
    var freezeTicks: Int { get }
    var freezeTicksMaximum: Int { get }
    
    /// The entities currently riding this entity.
    var passengers: [any Entity] { get } // TODO: make Set?
    
    /// The vehicle this entity is currently riding.
    var vehicle: (any Entity)? { get }
        
    mutating func tickEntity(_ server: any Server)
    
    /// Removes this entity from the server. Like it never existed (or "despawned").
    mutating func remove()
    
    /// Teleport this entity to a certain location.
    mutating func teleport(to location: any Location)
}

extension Entity {
    @inlinable
    public var world: any World {
        location.world
    }
}