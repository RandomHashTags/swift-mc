//
//  Animal.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

import Foundation

public protocol Animal: Breedable {
    var breeder: UUID? { get }
    /// Measured in ticks.
    var remainingLoveModeDuration: Int { get }
}

public extension Animal {
    var isLoveMode: Bool { remainingLoveModeDuration > 0 }
}