//
//  WorldBorder.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol WorldBorder {
    var size: Double { get }
    var center: Vector { get }

    /// Measured in blocks.
    var warningDistance: Int { get }
}
