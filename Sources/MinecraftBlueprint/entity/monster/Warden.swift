public protocol Warden: Monster {
    var anger: Int { get }
    var angryAt: (any LivingEntity)? { get }
    var angerLevel: any WardenAngerLevel { get }
}