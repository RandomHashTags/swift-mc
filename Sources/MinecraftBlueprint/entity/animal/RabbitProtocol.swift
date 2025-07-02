
public protocol RabbitProtocol: AnimalProtocol, Variantable where Variant: RabbitVariantProtocol {
    var variant: Variant { get }
}