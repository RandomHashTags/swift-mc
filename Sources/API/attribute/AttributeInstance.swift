
/// Mutable instance of an attribute with its current modifiers and values.
public struct AttributeInstance: Sendable {

    /// The `Attribute` pertaining to this instance.
    public let attribute:Attribute

    /// Base value of this instance before modifiers are applied.
    public var baseValue: Double {
        didSet {
            _value = calculateValue()
        }
    }

    /// Value of this instance after all associated modifiers have been applied.
    var _value:Double

    /// All modifiers present on this instance.
    var _modifiers:Set<AttributeModifier>
}

// MARK: Value
extension AttributeInstance {
    /// The default value of the `attribute`.
    public var defaultValue: Double {
        _read {
            yield attribute.defaultValue
        }
    }

    /// Calculates the `_value` taking into account the `baseValue` and all modifiers.
    private func calculateValue() -> Double {
        return baseValue // TODO: fix
    }
}

// MARK: Modifiers
extension AttributeInstance {
    /// All modifiers present on this instance.
    public var modifiers: Set<AttributeModifier> {
        _read {
            yield _modifiers
        }
    }

    /// Adds a modifier to this instance.
    /// 
    /// - Complexity: O(1).
    /// 
    /// - Warning: This method has no effect if a modifier of equal `id` is already present.
    /// 
    /// - Returns: (`true`, `newMember`) if `newMember` was not contained in the set.
    /// If an element equal to `newMember` was already contained in the set, the method returns (`false`, `oldMember`), where `oldMember` is the element that was equal to `newMember`.
    /// In some cases, `oldMember` may be distinguishable from `newMember` by identity comparison or some other means.
    @discardableResult
    public mutating func addModifier(_ modifier: AttributeModifier) -> (inserted: Bool, memberAfterInsert: AttributeModifier) {
        _modifiers.insert(modifier)
    }

    /// Removes a modifier from this instance.
    /// 
    /// - Complexity: O(1).
    /// 
    /// - Returns: The modifier of the `modifier` parameter if it is present; otherwise, `nil`.
    @discardableResult
    public mutating func removeModifier(_ modifier: AttributeModifier) -> AttributeModifier? {
        return _modifiers.remove(modifier)
    }
}