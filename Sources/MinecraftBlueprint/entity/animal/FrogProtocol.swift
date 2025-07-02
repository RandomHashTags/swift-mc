
public protocol FrogProtocol: AnimalProtocol, Variantable where Variant: FrogVariantProtocol {
    var tongueTarget: (any EntityProtocol)? { get }
    var variant: Variant { get }
}