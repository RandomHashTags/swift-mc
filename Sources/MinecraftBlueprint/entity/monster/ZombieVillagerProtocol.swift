
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol ZombieVillagerProtocol: ZombieProtocol, ~Copyable {
    var conversionInitiator: UUID { get }

    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }

    var villagerProfession: (any VillagerProfessionProtocol)? { get }
    var villagerVariant: any VillagerVariantProtocol { get }
}

extension ZombieVillagerProtocol {
    @inlinable
    public var isConverting: Bool {
        remainingConversionDuration > 0
    }
}