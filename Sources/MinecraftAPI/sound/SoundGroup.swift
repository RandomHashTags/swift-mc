//
//  SoundGroup.swift
//
//
//  Created by Evan Anderson on 11/26/23.
//

public protocol SoundGroup : MinecraftIdentifiable {
    var volume : Float { get }
    var pitch : Float { get }
    var soundBreak : any SoundEvent { get }
    var soundStep : any SoundEvent { get }
    var soundPlace : any SoundEvent { get }
    var soundHit : any SoundEvent { get }
    var soundFall : any SoundEvent { get }
}
