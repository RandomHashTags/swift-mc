
public protocol WolfProtocol: Sittable, Tameable, Variantable {
    var collarColor: Color { get }
    var tailAngle: Float { get }
    var isAngry: Bool { get }
    var isInterested: Bool { get }
    var isWet: Bool { get }
    var variant: any WolfVariantProtocol { get }
}