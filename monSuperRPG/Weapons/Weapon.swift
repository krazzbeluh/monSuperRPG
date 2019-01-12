//
//  Weapon.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Weapon {
//    this class contains all the properties of a weapon. name corresponding to the name of the weapon and damage corresponding to the power of the weapon. There are 2 class properties corresponding to the number of offensive and defensive weapons. These are used in Game class, in start method in the random event to generate a random weapon.
    let name: String
    let damage: Int
    
    static let numberOfDifferentOffensiveWeapons = 5
    static let numberOfDifferentDefensiveWeapons = 4
    
    init(name: String, damage: Int) {
        self.name = name
        self.damage = damage
    }
}
//all the class in this folder are different weapons, all constructed by the Weapon class
