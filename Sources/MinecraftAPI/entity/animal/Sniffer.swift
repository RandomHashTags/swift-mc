//
//  Sniffer.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Sniffer : Animal {
    var canDig : Bool { get }
    var findDigLocation : (any Location)? { get }
    var exploredLocations : [any Location] { get } // TODO: make set
    var state : any SnifferState { get }
}