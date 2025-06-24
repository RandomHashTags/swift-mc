import Foundation

public protocol ZombieVillager: Zombie {
    var conversionInitiator: UUID { get }

    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }

    var villagerProfession: (any VillagerProfession)? { get }
    var villagerVariant: any VillagerVariant { get }
}

public extension ZombieVillager {
    var isConverting: Bool { remainingConversionDuration > 0 }
}