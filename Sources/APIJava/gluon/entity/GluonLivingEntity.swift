//
//  GluonLivingEntity.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

/*
final class GluonLivingEntity : LivingEntity {
    var canBreatheUnderwater:Bool
    var canPickupItems:Bool
    var hasAI:Bool
    
    var isClimbing:Bool
    var isCollidable:Bool
    var isGliding:Bool
    var isInvisible:Bool
    var isLeashed:Bool
    var isRiptiding:Bool
    var isSleeping:Bool
    var isSwimming:Bool
    
    var potionEffects:[String:any PotionEffect]
    var noDamageTicks:UInt16
    var noDamageTicksMaximum:UInt16
    
    var airRemainingTicks:UInt16
    var airMaximumTicks:UInt16
    
    var health:Double
    var healthMaximum:Double
    
    var id:UInt64
    var uuid:UUID
    var typeID:String
    var type : (EntityType)? {
        return GluonServer.shared.get_entity_type(identifier: type_id)
    }
    var ticks_lived:UInt64
    let name:String
    var customName:String?
    var displayName:String?
    
    var boundaries:[Boundary]
    var location:any Location
    var velocity:Vector
    
    var fallDistance:Float
    
    var is_glowing:Bool
    var is_on_fire:Bool
    var is_on_ground:Bool
    
    var height:Float
    
    var fireTicks:UInt16
    var fireTicksMaximum:UInt16
    var freezeTicks:UInt16
    var freezeTicksMaximum:UInt16
    
    var passengerUUIDs:Set<UUID>
    var passengers : [any Entity] {
        return GluonServer.shared.getEntities(uuids: passengerUUIDs)
    }
    
    var vehicleUUID:UUID?
    var vehicle : (any Entity)? {
        guard let uuid:UUID = vehicleUUID else { return nil }
        return GluonServer.shared.getEntity(uuid: uuid)
    }
    
    init(
        canBreatheUnderwater: Bool,
        canPickupItems: Bool,
        hasAI: Bool,
        isClimbing: Bool,
        isCollidable: Bool,
        isGliding: Bool,
        isInvisible: Bool,
        isLeashed: Bool,
        isRiptiding: Bool,
        isSleeping: Bool,
        isSwimming: Bool,
        potionEffects: [String : any PotionEffect],
        noDamageTicks: UInt16,
        noDamageTicksMaximum: UInt16,
        air_remaining: UInt16,
        air_maximum: UInt16,
        health: Double,
        healthMaximum: Double,
        id: UInt64,
        uuid: UUID,
        type_id: String,
        ticks_lived: UInt64,
        name: String,
        customName: String? = nil,
        displayName: String? = nil,
        boundaries: [Boundary],
        location: any Location,
        velocity: Vector,
        fallDistance: Float,
        is_glowing: Bool,
        is_on_fire: Bool,
        is_on_ground: Bool,
        height: Float,
        fireTicks: UInt16,
        fireTicksMaximum: UInt16,
        freezeTicks: UInt16,
        freezeTicksMaximum: UInt16,
        passengerUUIDs: Set<UUID>,
        vehicleUUID: UUID? = nil
    ) {
        self.canBreatheUnderwater = canBreatheUnderwater
        self.canPickupItems = canPickupItems
        self.hasAI = hasAI
        self.isClimbing = isClimbing
        self.isCollidable = isCollidable
        self.isGliding = isGliding
        self.isInvisible = isInvisible
        self.isLeashed = isLeashed
        self.isRiptiding = isRiptiding
        self.isSleeping = isSleeping
        self.isSwimming = isSwimming
        self.potionEffects = potionEffects
        self.noDamageTicks = noDamageTicks
        self.noDamageTicksMaximum = noDamageTicksMaximum
        self.airRemainingTicks = air_remaining
        self.airMaximumTicks = air_maximum
        self.health = health
        self.healthMaximum = healthMaximum
        self.id = id
        self.uuid = uuid
        self.type_id = type_id
        self.ticks_lived = ticks_lived
        self.name = name
        self.customName = customName
        self.displayName = displayName
        self.boundaries = boundaries
        self.location = location
        self.velocity = velocity
        self.fallDistance = fallDistance
        self.is_glowing = is_glowing
        self.is_on_fire = is_on_fire
        self.is_on_ground = is_on_ground
        self.height = height
        self.fireTicks = fireTicks
        self.fireTicksMaximum = fireTicksMaximum
        self.freezeTicks = freezeTicks
        self.freezeTicksMaximum = freezeTicksMaximum
        self.passengerUUIDs = passengerUUIDs
        self.vehicleUUID = vehicleUUID
    }
    
    /*
    init(from decoder: Decoder) throws {
        let living_entity_container:KeyedDecodingContainer = try decoder.container(keyedBy: LivingEntityCodingKeys.self)
        self.canBreatheUnderwater = try living_entity_container.decode(Bool.self, forKey: .canBreatheUnderwater)
        self.canPickupItems = try living_entity_container.decode(Bool.self, forKey: .canPickupItems)
        self.hasAI = try living_entity_container.decode(Bool.self, forKey: .hasAI)
        self.isClimbing = try living_entity_container.decode(Bool.self, forKey: .isClimbing)
        self.isCollidable = try living_entity_container.decode(Bool.self, forKey: .isCollidable)
        self.isGliding = try living_entity_container.decode(Bool.self, forKey: .isGliding)
        self.isInvisible = try living_entity_container.decode(Bool.self, forKey: .isInvisible)
        self.isLeashed = try living_entity_container.decode(Bool.self, forKey: .isLeashed)
        self.isRiptiding = try living_entity_container.decode(Bool.self, forKey: .isRiptiding)
        self.isSleeping = try living_entity_container.decode(Bool.self, forKey: .isSleeping)
        self.isSwimming = try living_entity_container.decode(Bool.self, forKey: .isSwimming)
        self.potionEffects = try living_entity_container.decode([String : GluonPotionEffect].self, forKey: .potionEffects)
        self.noDamageTicks = try living_entity_container.decode(UInt16.self, forKey: .noDamageTicks)
        self.noDamageTicksMaximum = try living_entity_container.decode(UInt16.self, forKey: .noDamageTicksMaximum)
        self.air_remaining = try living_entity_container.decode(UInt16.self, forKey: .air_remaining)
        self.air_maximum = try living_entity_container.decode(UInt16.self, forKey: .air_maximum)
        
        let damageable_container:KeyedDecodingContainer = try decoder.container(keyedBy: DamageableCodingKeys.self)
        self.health = try damageable_container.decode(Double.self, forKey: .health)
        self.healthMaximum = try damageable_container.decode(Double.self, forKey: .healthMaximum)
        
        let entity_container:KeyedDecodingContainer = try decoder.container(keyedBy: EntityCodingKeys.self)
        self.uuid = try entity_container.decode(UUID.self, forKey: .uuid)
        let type_identifier:String = try entity_container.decode(String.self, forKey: .type)
        self.type = GluonServer.shared.get_entity_type(identifier: type_identifier)!
        self.ticks_lived = try entity_container.decode(UInt64.self, forKey: .ticks_lived)
        self.customName = try entity_container.decodeIfPresent(String.self, forKey: .customName)
        self.displayName = try entity_container.decodeIfPresent(String.self, forKey: .displayName)
        self.boundaries = try entity_container.decode([Boundary].self, forKey: .boundaries)
        self.location = try entity_container.decode(TargetLocation.self, forKey: .location)
        self.velocity = try entity_container.decode(Vector.self, forKey: .velocity)
        self.fallDistance = try entity_container.decode(Float.self, forKey: .fallDistance)
        self.is_glowing = try entity_container.decode(Bool.self, forKey: .is_glowing)
        self.is_on_fire = try entity_container.decode(Bool.self, forKey: .is_on_fire)
        self.is_on_ground = try entity_container.decode(Bool.self, forKey: .is_on_ground)
        self.height = try entity_container.decode(Float.self, forKey: .height)
        self.fireTicks = try entity_container.decode(UInt16.self, forKey: .fireTicks)
        self.fireTicksMaximum = try entity_container.decode(UInt16.self, forKey: .fireTicksMaximum)
        self.freezeTicks = try entity_container.decode(UInt16.self, forKey: .freezeTicks)
        self.freezeTicksMaximum = try entity_container.decode(UInt16.self, forKey: .freezeTicksMaximum)
        self.passengerUUIDs = try entity_container.decode(Set<UUID>.self, forKey: .passengerUUIDs)
        self.vehicleUUID = try entity_container.decodeIfPresent(UUID.self, forKey: .vehicleUUID)
    }*/
}
*/
