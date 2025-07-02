
public protocol TropicalFish: Fish, ~Copyable {
    var bodyColor: Color { get }
    var patternColor: Color { get }
    var variant: any TropicalFishVariant { get }
}