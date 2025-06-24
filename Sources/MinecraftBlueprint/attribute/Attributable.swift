public protocol Attributable {
    func getAttribute(_ attribute: any Attribute) -> (any AttributeActive)?
}