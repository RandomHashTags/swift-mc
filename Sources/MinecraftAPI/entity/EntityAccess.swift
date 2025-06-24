//
//  EntityAccess.swift
//
//
//  Created by Evan Anderson on 11/26/23.
//

import Foundation

public protocol EntityAccess {
    var id: UInt64 { get }
    var uuid: UUID { get }
    var shouldBeSaved: Bool { get }
    var isAlwaysTicking: Bool { get }
}
