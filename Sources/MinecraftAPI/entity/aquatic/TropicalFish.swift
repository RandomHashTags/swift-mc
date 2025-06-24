public protocol TropicalFish: Fish {
    var bodyColor: Color { get }
    var patternColor: Color { get }
    var variant: any TropicalFishVariant { get }
}