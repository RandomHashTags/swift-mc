public protocol Attributable: Sendable {
    func getAttribute(_ attribute: any Attribute) -> (any AttributeActive)?
}