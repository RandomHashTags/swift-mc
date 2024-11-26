//
//  Block.swift
//  
//
//  Created by Evan Anderson on 2/4/23.
//

public protocol Block : BlockBehavior, Tickable {
    var materialID : String { get }
    var material : (any Material)? { get }
    
    var instrument : (any Instrument)? { get }
    
    var stepSound : (any Sound)? { get }
    
    var data : any BlockData { get }
    var location : any Location { get }
    
    var growableAge : Int? { get }
    
    var lootTable : LootTable? { get }
    
    func breakNaturally()
    
    func isPreferredTool(_ material: any Material) -> Bool
    /// Measured in ticks.
    func getBreakingSpeed(_ itemStack: any ItemStack) -> Float
    /// Measured in ticks.
    func getBreakingSpeed(_ player: any Player) -> Float
}

public extension Block {
    var isFullyGrown : Bool {
        return growableAge ?? 0 >= material?.configuration.block?.growable?.maximumAge ?? 0
    }
    
    func isPreferredTool(_ material: any Material) -> Bool {
        return false // TODO: fix
        //let identifier:String = material.id
        //return self.material?.configuration.block?.preferred_break_material_identifiers?.contains(identifier) ?? false
    }
}

public extension Block {
    func serverTPSSlowed(to tps: Int, divisor: Int) {
        // TODO: fix?
    }
    func serverTPSIncreased(to tps: Int, multiplier: Int) {
        // TODO: fix?
    }
}
