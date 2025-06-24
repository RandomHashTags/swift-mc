public protocol Frog: Animal, Variantable {
    var tongueTarget: (any Entity)? { get }
    var variant: any FrogVariant { get }
}