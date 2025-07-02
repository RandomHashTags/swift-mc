
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol AnimalProtocol: Breedable, ~Copyable {
    var breeder: UUID? { get }
    /// Measured in ticks.
    var remainingLoveModeDuration: Int { get }
}

extension AnimalProtocol {
    @inlinable
    public var isLoveMode: Bool {
        remainingLoveModeDuration > 0
    }
}