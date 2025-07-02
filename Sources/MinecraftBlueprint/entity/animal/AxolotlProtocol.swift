
public protocol AxolotlProtocol: AnimalProtocol, Variantable {
    var isPlayingDead: Bool { get }
    var variant: any AxolotlVariantProtocol { get }
}