//
//  DamageSource.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol DamageSource {
    var type : any DamageType { get }

    /// The `Entity` that inflicted the damage.
    var entity : (any Entity)? { get }

    /// The `Entity` that threw/shot the `entity`.
    var sourceEntity : (any Entity)? { get }

    /// The `sourceEntity`'s location when they shot/threw the `entity`.
    var sourceEntityLocation : (any Location)? { get }

    /// Where the damage originated from.
    var location : (any Location)? { get }

    var foodExhaustion : Float { get }
    var scalesWithDifficulty : Bool { get }
}