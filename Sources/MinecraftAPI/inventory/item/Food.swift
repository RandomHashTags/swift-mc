//
//  Food.swift
//  
//
//  Created by Evan Anderson on 11/28/24.
//

public protocol Food {
    /// The food restored when this item is consumed.
    var nutrition: Int { get }

    /// The saturation restored when this item is consumed.
    var saturation: Float { get }
}