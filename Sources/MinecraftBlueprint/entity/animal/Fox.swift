#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol Fox: Animal, Sittable, Variantable {
    var isCrouching: Bool { get }
    var isFaceplanted: Bool { get }
    var isSleeping: Bool { get }
    var trustedEntities: [UUID] { get }
    var variant: any FoxVariant { get }
}