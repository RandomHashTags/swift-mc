public protocol Rabbit: Animal, Variantable {
    var variant: any RabbitVariant { get }
}