
public protocol CatProtocol: Sittable, Tameable, Variantable where Variant: CatVariantProtocol {    

    var collarColor: Color { get }
    var variant: Variant { get }
}