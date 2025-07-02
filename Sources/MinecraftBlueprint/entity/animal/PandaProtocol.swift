
public protocol PandaProtocol: AnimalProtocol, Sittable, ~Copyable {
    /// Measured in ticks.
    var unhappyDuration: Int { get }

    var isEating: Bool { get }
    var isOnBack: Bool { get }
    var isRolling: Bool { get }
    var isScared: Bool { get }
    var isSneezing: Bool { get }

    var hiddenGene: any PandaGene { get }
    var mainGene: any PandaGene { get }
}