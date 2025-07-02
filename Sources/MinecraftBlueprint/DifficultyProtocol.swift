
public protocol DifficultyProtocol: MinecraftIdentifiable, Nameable {
    var damageMultiplier: Double { get }
}

// TODO: move to own file
/*
extension Difficulty {
    public static let peaceful:Difficulty = Difficulty(id: "minecraft.peaceful", name: "Peaceful", damageMultiplier: 0.0)
    public static let easy:Difficulty = Difficulty(id: "minecraft.easy", name: "Easy", damageMultiplier: 0.5)
    public static let normal:Difficulty =  Difficulty(id: "minecraft.normal", name: "Normal", damageMultiplier: 1)
    public static let hard:Difficulty = Difficulty(id: "minecraft.hard", name: "Hard", damageMultiplier: 1.5)
}*/