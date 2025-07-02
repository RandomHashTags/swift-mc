
public protocol LivingEntityPartableProtocol: LivingEntityProtocol, ~Copyable {
    var parts: [any EntityPartProtocol] { get } // TODO: make Set
}