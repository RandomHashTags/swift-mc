public protocol Cat: Sittable, Tameable, Variantable {
    var collarColor: Color { get }
    var variant: any CatVariant { get }
}