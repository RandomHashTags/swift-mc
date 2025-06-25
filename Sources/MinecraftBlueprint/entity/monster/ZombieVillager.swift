#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol ZombieVillager: Zombie {
    var conversionInitiator: UUID { get }

    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }

    var villagerProfession: (any VillagerProfession)? { get }
    var villagerVariant: any VillagerVariant { get }
}

extension ZombieVillager {
    @inlinable
    public var isConverting: Bool {
        remainingConversionDuration > 0
    }
}