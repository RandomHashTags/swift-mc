
public protocol LivingEntityPartable: LivingEntity, ~Copyable {
    var parts: [any EntityPart] { get } // TODO: make Set
}