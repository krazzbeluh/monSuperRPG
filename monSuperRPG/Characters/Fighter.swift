//
//  Fighter.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Fighter: Character {
    init() {
        let sword = Sword()
        super.init(maxLife: 100, weapon: sword)
    }
    
}
