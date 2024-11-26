//
//  Art.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Art : Identifiable where ID == String {
    /// Measured in blocks.
    var width : Int { get }
    /// Measured in blocks.
    var height : Int { get }
}
