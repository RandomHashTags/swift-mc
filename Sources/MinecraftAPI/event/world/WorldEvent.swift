//
//  WorldEvent.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol WorldEvent : Event {
    var world : any World { get }
}
