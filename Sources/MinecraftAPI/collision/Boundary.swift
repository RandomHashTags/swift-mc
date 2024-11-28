//
//  Boundary.swift
//  
//
//  Created by Evan Anderson on 2/4/23.
//

public protocol Boundary {
    var type : any BoundaryType { get }

    func contains(_ boundary: any Boundary) -> Bool
}
