
public protocol ArmorStandProtocol: LivingEntityProtocol, ~Copyable {
    var headPose: Vector { get }
    var pose: Vector { get }
    var leftArmPose: Vector { get }
    var leftLegPose: Vector { get }
    var rightArmPose: Vector { get }
    var rightLegPose: Vector { get }
    var hasArms: Bool { get }
    var hasBasePlate: Bool { get }
    var isMarker: Bool { get }
    var isSmall: Bool { get }
    var isVisible: Bool { get }
}