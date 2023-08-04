//
//  CPMPCommands.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import Foundation

public extension ClientPacketMojang.Play {
    /// Lists all of the commands on the server, and how they are parsed.
    ///
    /// This is a directed graph, with one root node. Each redirect or child node must refer only to nodes that have already been declared.
    struct Commands : ClientPacketMojangProtocol {
        /// Number of elements in `nodes`.
        let count:Int
        let nodes:[CommandNodeMojang]
        /// Index of the `root` node in `nodes`.
        let root_index:Int
    }
}