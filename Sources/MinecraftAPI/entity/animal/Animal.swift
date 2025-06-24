import Foundation

public protocol Animal: Breedable {
    var breeder: UUID? { get }
    /// Measured in ticks.
    var remainingLoveModeDuration: Int { get }
}

public extension Animal {
    var isLoveMode: Bool { remainingLoveModeDuration > 0 }
}