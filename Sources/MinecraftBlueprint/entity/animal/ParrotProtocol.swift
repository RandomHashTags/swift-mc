
public protocol ParrotProtocol: Flyable, Sittable, Tameable, Variantable where Variant: ParrotVariantProtocol {
    var isDancing: Bool { get }
    var variant: Variant { get }
}