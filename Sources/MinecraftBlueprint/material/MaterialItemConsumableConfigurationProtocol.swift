
public protocol MaterialItemConsumableConfigurationProtocol: MinecraftIdentifiable, ServerTickChangeListenerProtocol {
    associatedtype ConsumableCondition: ConsumableConditionProtocol

    /// Amount of ticks required of consuming to consider this item to be consumed.
    var duration: UInt64 { get }

    /// The condition which controls when this item can be consumed.
    var condition: ConsumableCondition { get }
    
    /// The default food restored by this item when consumed.
    var nutrition: Int { get }
    var saturationModifier: Float { get }
    var effects: [any PotionEffectProtocol] { get }

    var drinkingSound: (any SoundProtocol)? { get }
    var eatingSound: (any SoundProtocol)? { get }

    /*func consumed<T: LivingEntityProtocol>(
        by entity: inout T
    )*/
}