
public enum SpawnCategory: String, CaseIterable, Sendable {
    /// - Example: Bat
    case ambient

    /// - Example: Strider, Cow, Turtle
    case animal

    /// All Axolotls are represented by this category.
    case axolotl

    /// - Example: Player, Armor Stand, Boat
    case misc

    /// - Example: Witch, Zombie, Creeper
    case monster

    /// - Example: Cod, Pufferfish, Tropical Fish, Salmon
    case waterAmbient

    /// - Example: Squid or Dolphin
    case waterAnimal

    /// - Example: Glow Squid
    case waterUndergroundCreature
}