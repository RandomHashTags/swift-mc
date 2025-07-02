
public protocol CatProtocol: Sittable, Tameable, Variantable {
    var collarColor: Color { get }
    var variant: any CatVariantProtocol { get }
}