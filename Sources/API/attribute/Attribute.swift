//
//  Attribute.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Attribute : MultilingualName, Identifiable {
    var baseValue : Double { get set }
    var description : String { get }
}
