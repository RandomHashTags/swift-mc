//
//  Material.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Foundation

public struct Material : Hashable {
    public let identifier:String
    public let categories:[UnsafePointer<MaterialCategory>]
    public let configuration:UnsafePointer<MaterialConfiguration>
}
