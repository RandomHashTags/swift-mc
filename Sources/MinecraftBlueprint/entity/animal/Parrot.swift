public protocol Parrot: Flyable, Sittable, Tameable, Variantable {
    var isDancing: Bool { get }
    var variant: any ParrotVariant { get }
}