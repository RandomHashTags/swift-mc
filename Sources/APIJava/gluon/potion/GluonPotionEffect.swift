//
//  GluonPotionEffect.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

final class GluonPotionEffect : PotionEffect {
    let typeID:String
    var type : (PotionEffectType)? {
        return GluonServer.shared.get_potion_effect_type(identifier: type_id)
    }
    
    var has_icon:Bool
    var has_particles:Bool
    var is_ambient:Bool
    
    var amplifier:UInt16
    var duration:UInt16
    
    init(type_id: String, has_icon: Bool, has_particles: Bool, is_ambient: Bool, amplifier: UInt16, duration: UInt16) {
        self.type_id = type_id
        self.has_icon = has_icon
        self.has_particles = has_particles
        self.is_ambient = is_ambient
        self.amplifier = amplifier
        self.duration = duration
    }
    
    func tick(_ server: any Server) {
        duration -= 1
    }
}
