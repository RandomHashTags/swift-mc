//
//  EntityTeleportEvent.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol EntityTeleportEvent: EntityEventCancellable {
    var newLocation: any Location { get }
}
