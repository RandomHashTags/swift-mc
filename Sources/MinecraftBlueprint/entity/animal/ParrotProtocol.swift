
public protocol ParrotProtocol: Flyable, Sittable, Tameable, Variantable {
    var isDancing: Bool { get }
    var variant: any ParrotVariantProtocol { get }
}