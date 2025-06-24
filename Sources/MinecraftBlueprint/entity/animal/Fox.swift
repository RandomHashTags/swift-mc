import Foundation

public protocol Fox: Animal, Sittable, Variantable {
    var isCrouching: Bool { get }
    var isFaceplanted: Bool { get }
    var isSleeping: Bool { get }
    var trustedEntities: [UUID] { get }
    var variant: any FoxVariant { get }
}