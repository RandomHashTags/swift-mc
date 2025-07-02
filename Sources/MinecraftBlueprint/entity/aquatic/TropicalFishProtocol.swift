
public protocol TropicalFishProtocol: FishProtocol, ~Copyable {
    var bodyColor: Color { get }
    var patternColor: Color { get }
    var variant: any TropicalFishVariantProtocol { get }
}