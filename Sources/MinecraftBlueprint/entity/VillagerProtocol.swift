
public protocol VillagerProtocol: Merchantable, ~Copyable {
    associatedtype Profession: VillagerProfessionProtocol
    associatedtype Variant: VillagerVariantProtocol
    associatedtype Zombified: ZombieVillagerProtocol

    var experience: Int { get }
    var level: Int { get }
    var profession: Profession { get }
    var variant: Variant { get }

    func shakeHead()

    func sleep(
        at location: Location
    ) -> Bool

    func wakeUp()

    func zombify() -> Zombified
}