
public protocol VillagerProtocol: Merchantable, ~Copyable {
    var experience: Int { get }
    var level: Int { get }
    var profession: any VillagerProfessionProtocol { get }
    var variant: any VillagerVariantProtocol { get }

    func shakeHead()
    func sleep(at location: any LocationProtocol) -> Bool
    func wakeUp()
    func zombify() -> any ZombieVillagerProtocol
}