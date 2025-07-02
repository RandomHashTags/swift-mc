
public protocol MushroomCowProtocol: CowProtocol, Variantable where Variant: MushroomCowVariantProtocol {
    var milkedPotionEffects: [any PotionEffectProtocol] { get } // TODO: make Set
    var variant: Variant { get }
}