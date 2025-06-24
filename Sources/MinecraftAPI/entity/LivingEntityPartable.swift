public protocol LivingEntityPartable: LivingEntity {
    var parts: [any EntityPart] { get } // TODO: make Set
}