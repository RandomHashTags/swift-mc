
public struct AttributeModifier: Sendable {
    public let id:String

    /// Amount this modifier will apply its `operation`.
    public let amount:Double

    /// Name of this modifier.
    public let name:String

    /// `AttributeModifierOperation` this modifier will apply.
    public let operation:AttributeModifierOperation

    /// The `EquipmentSlotGroup` this modifier is active on.
    public let slotGroup:EquipmentSlotGroup
}

// MARK: Hashable
extension AttributeModifier: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}