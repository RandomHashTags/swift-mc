
public protocol Attributable: Sendable, ~Copyable {
    func getAttribute(
        _ attribute: any AttributeProtocol
    ) -> (any AttributeActiveProtocol)?
}