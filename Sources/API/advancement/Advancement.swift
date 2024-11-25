//
//  Advancement.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

import Foundation

public protocol Advancement : Identifiable, MultilingualName {    
    var description : String { get }
    var criteria : [String] { get }
    var completed : Date? { get }
}