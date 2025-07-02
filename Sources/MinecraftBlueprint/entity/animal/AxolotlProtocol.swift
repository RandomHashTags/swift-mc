
public protocol AxolotlProtocol: AnimalProtocol, Variantable where Variant: AxolotlVariantProtocol {
    var isPlayingDead: Bool { get }
    var variant: Variant { get }
}