
public protocol MushroomCow: Cow, Variantable {
    var milkedPotionEffects: [any PotionEffect] { get } // TODO: make Set
    var variant: any MushroomCowVariant { get }
}