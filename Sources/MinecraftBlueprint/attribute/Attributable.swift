
public protocol Attributable: Sendable, ~Copyable {
    func getAttribute(_ attribute: any Attribute) -> (any AttributeActive)?
}