
public protocol TropicalFishProtocol: FishProtocol, ~Copyable {
    associatedtype Variant: TropicalFishVariantProtocol

    var bodyColor: Color { get }
    var patternColor: Color { get }
    var variant: Variant { get }
}