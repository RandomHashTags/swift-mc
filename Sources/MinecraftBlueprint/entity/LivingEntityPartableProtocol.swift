
public protocol LivingEntityPartableProtocol: LivingEntityProtocol, ~Copyable {
    associatedtype Part: EntityPartProtocol

    var parts: [Part] { get } // TODO: make Set
}