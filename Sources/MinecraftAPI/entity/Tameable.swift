//
//  Tameable.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

import Foundation

public protocol Tameable : Animal {
    var owner : UUID? { get }
}

public extension Tameable {
    var isTamed : Bool { owner != nil }
}