//
//  EventListener.swift
//  
//
//  Created by Evan Anderson on 2/11/23.
//

public protocol EventListener {
    var priority : UInt8 { get }
    func handle(event: any Event)
}

public extension EventListener {
    var priority : UInt8 { EventPriority.normal }
}
