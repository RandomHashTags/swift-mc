//
//  Villager.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Villager : Merchantable {
    var experience : Int { get }
    var level : Int { get }
    var profession : any VillagerProfession { get }
    var variant : any VillagerVariant { get }

    func shakeHead()
    func sleep(at location: any Location) -> Bool
    func wakeUp()
    func zombify() -> any ZombieVillager
}