//
//  Salmon.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Salmon: Fish {
    var variant: any SalmonVariant { get }
}