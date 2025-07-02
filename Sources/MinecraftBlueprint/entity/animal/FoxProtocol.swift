
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol FoxProtocol: AnimalProtocol, Sittable, Variantable where Variant: FoxVariantProtocol {
    

    var isCrouching: Bool { get }
    var isFaceplanted: Bool { get }
    var isSleeping: Bool { get }
    var trustedEntities: [UUID] { get }
    var variant: Variant { get }
}