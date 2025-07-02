
public protocol FrogProtocol: AnimalProtocol, Variantable {
    var tongueTarget: (any EntityProtocol)? { get }
    var variant: any FrogVariantProtocol { get }
}