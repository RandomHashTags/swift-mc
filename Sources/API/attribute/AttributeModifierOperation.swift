
public enum AttributeModifierOperation: CaseIterable, Hashable, Sendable {
    /// Adds (or subtracts) the specified amount to the base value.
    case addNumber

    /// Adds this scalar of amount to the base value.
    case addScalar

    /// Multiply amount by this value, after adding 1 to it.
    case multiplyScalar1
}