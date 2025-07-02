
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol ZombieVillagerProtocol: ZombieProtocol, ~Copyable {
    associatedtype Profession:VillagerProfessionProtocol
    associatedtype Variant: VillagerVariantProtocol

    var conversionInitiator: UUID { get }

    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }

    var villagerProfession: Profession? { get }
    var villagerVariant: Variant { get }
}

extension ZombieVillagerProtocol {
    @inlinable
    public var isConverting: Bool {
        remainingConversionDuration > 0
    }
}