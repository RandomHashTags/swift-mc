
public protocol Warden: Monster, ~Copyable {
    var anger: Int { get }
    var angryAt: (any LivingEntity)? { get }
    var angerLevel: any WardenAngerLevel { get }
}