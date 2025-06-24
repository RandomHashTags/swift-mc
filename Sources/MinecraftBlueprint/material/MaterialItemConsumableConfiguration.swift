public protocol MaterialItemConsumableConfiguration: MinecraftIdentifiable, ServerTickChangeListener {
    /// Amount of ticks required of consuming to consider this item to be consumed.
    var duration: UInt64 { get }

    /// The condition which controls when this item can be consumed.
    var condition: any ConsumableCondition { get }
    
    /// The default food restored by this item when consumed.
    var nutrition: Int { get }
    var saturationModifier: Float { get }
    var effects: [any PotionEffect] { get }

    var drinkingSound: (any Sound)? { get }
    var eatingSound: (any Sound)? { get }
}