//
//  Event.swift
//  
//
//  Created by Evan Anderson on 2/11/23.
//

public protocol Event {
    var eventType : any EventType { get }
}