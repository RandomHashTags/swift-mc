//
//  Location.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol Location {
    var world : any World { get }
    var x : Double { get }
    var y : Double { get }
    var z : Double { get }
    var yaw : Double { get }
    var pitch : Double { get }
    
    init(world: any World, x: Double, y: Double, z: Double, yaw: Double, pitch: Double)
    
    var chunkCoordinates : (x: Int, z: Int) { get }
    
    /// Whether or not the two locations are the same, regardless of `yaw` or `pitch`.
    func isSimilar(_ location: Self) -> Bool
    
    func isNearby(center: any Location, xRadius: Double, yRadius: Double, zRadius: Double) -> Bool
    
    /// Gets the distance between two locations, regardless of world.
    func distance(to location: any Location) -> (x: Double, y: Double, z: Double)
    
    /// Returns self after adding the specified distances to self.
    @discardableResult mutating func adding(x: Double, y: Double, z: Double, yaw: Double, pitch: Double) -> Self
    
    /// Returns a new `Self` by adding the specified distances to this location.
    func advancedBy(x: Double, y: Double, z: Double, yaw: Double, pitch: Double) -> Self
}