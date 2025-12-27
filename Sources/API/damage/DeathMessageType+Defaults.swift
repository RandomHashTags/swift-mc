
extension DeathMessageType {
    /// No special death message logic is applied
    public static let `default` = create(id: "minecraft.default")

    // Shows a variant of fall damage death instead of a regular death message.
    public static let fallVariants = create(id: "minecraft.fallVariants")

    /// Shows the intential game design death message instead of a regular death message.
    public static let intentialGameDesign = create(id: "minecraft.intentialGameDesign")
}