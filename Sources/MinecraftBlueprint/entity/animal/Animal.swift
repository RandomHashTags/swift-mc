
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol Animal: Breedable, ~Copyable {
    var breeder: UUID? { get }
    /// Measured in ticks.
    var remainingLoveModeDuration: Int { get }
}

extension Animal {
    @inlinable
    public var isLoveMode: Bool {
        remainingLoveModeDuration > 0
    }
}