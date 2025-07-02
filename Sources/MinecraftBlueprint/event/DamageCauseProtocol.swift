
public protocol DamageCauseProtocol: MinecraftIdentifiable {
}

/*
public enum DamageCause: MinecraftIdentifiable {
    case contact
    case entityAttack(damager: any Entity)
    case projectile(projectile: any Projectile)
    case suffocation
    case fall
    case fire
    case fireTick
    case melting
    case lava
    case drowning
    case block(block: any Block)
    case blockExplosion(block: any Block)
    case entityExplosion(entity: any Entity)
    case void
    case lightning
    case suicide
    case starvation
    case potionEffect(potionEffect: any PotionEffect)
    case fallingBlock(block: any Block)
    case enchantment(enchant: any EnchantmentType)
    case cramming
    
    case custom(identifier: String, value: Any? = nil)
    
    public var id: String {
        switch self {
        case .contact,
                .suffocation,
                .fall,
                .fire,
                .fireTick,
                .melting,
                .lava,
                .drowning,
                .void,
                .lightning,
                .suicide,
                .starvation,
                .cramming:
            return String(describing: self)
        case .entityAttack(damager: _):
            return "entityAttack"
        case .projectile(projectile: _):
            return "projectile"
        case .block(block: _):
            return "block"
        case .blockExplosion(block: _):
            return "blockExplosion"
        case .entityExplosion(entity: _):
            return "entityExplosion"
        case .potionEffect(potionEffect: _):
            return "potionEffect"
        case .fallingBlock(block: _):
            return "fallingBlock"
        case .enchantment(enchant: _):
            return "enchantment"
            
        case .custom(identifier: let identifier, value: .some(_)):
            return identifier
        case .custom(identifier: let identifier, value: .none):
            return identifier
        }
    }
}
*/