
/// Various difficulty levels.
public enum Difficulty: Sendable {
    /// Hostile mobs spawn, enemies deal less damage than `normal`, the hunger bar does deplete and starving deals up to 5 hearts of damage.
    case easy

    /// Hostile mobs spawn, enemies deal greater damage than `normal`, the hunger bar does deplete and starving can kill players.
    case hard

    /// Hostile mobs spawn, enemies deal normal amounts of damage, the hunger bar does deplete and starving deals up to 9.5 hearts of damage.
    case normal

    /// Players regain health over time, hostile mobs don't spawn, the hunger bar does not deplete.
    case peaceful
}