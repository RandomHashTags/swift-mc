
public protocol RabbitProtocol: AnimalProtocol, Variantable {
    var variant: any RabbitVariantProtocol { get }
}