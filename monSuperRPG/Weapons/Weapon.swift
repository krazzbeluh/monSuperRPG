//
//  Weapon.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Weapon {
    let name: String
    let damage: Int
    
    static let numberOfDifferentOffensiveWeapons = 5
    static let numberOfDifferentDefensiveWeapons = 4
    
    init(name: String, damage: Int) {
        self.name = name
        self.damage = damage
    }
}
