
public protocol Difficulty: MinecraftIdentifiable, Nameable {
    var damageMultiplier: Double { get }
}

// TODO: move to own file
/*
public extension Difficulty {
    static let peaceful:Difficulty = Difficulty(id: "minecraft.peaceful", name: "Peaceful", damageMultiplier: 0.0)
    static let easy:Difficulty = Difficulty(id: "minecraft.easy", name: "Easy", damageMultiplier: 0.5)
    static let normal:Difficulty =  Difficulty(id: "minecraft.normal", name: "Normal", damageMultiplier: 1)
    static let hard:Difficulty = Difficulty(id: "minecraft.hard", name: "Hard", damageMultiplier: 1.5)
}*/