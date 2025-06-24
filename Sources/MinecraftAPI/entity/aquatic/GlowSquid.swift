//
//  GlowSquid.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol GlowSquid: Squid {
    /// Measured in ticks.
    var remainingDarkDuration: Int { get }
}