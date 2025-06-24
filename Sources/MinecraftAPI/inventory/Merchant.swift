//
//  Merchant.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

import Foundation

public protocol Merchant {
    var trades: [any MerchantRecipe] { get }
    var traders: [UUID] { get }
    var isTrading: Bool { get }
}

public extension Merchant {
    var isTrading: Bool { !traders.isEmpty }
}