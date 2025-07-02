
public protocol PandaProtocol: AnimalProtocol, Sittable, ~Copyable {
    associatedtype HiddenGene: PandaGene
    associatedtype MainGene: PandaGene

    /// Measured in ticks.
    var unhappyDuration: Int { get }

    var isEating: Bool { get }
    var isOnBack: Bool { get }
    var isRolling: Bool { get }
    var isScared: Bool { get }
    var isSneezing: Bool { get }

    var hiddenGene: HiddenGene { get }
    var mainGene: MainGene { get }
}