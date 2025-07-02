
public protocol MushroomCowProtocol: CowProtocol, Variantable {
    var milkedPotionEffects: [any PotionEffectProtocol] { get } // TODO: make Set
    var variant: any MushroomCowVariant { get }
}