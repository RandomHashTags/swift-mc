public protocol Axolotl: Animal, Variantable {
    var isPlayingDead: Bool { get }
    var variant: any AxolotlVariant { get }
}