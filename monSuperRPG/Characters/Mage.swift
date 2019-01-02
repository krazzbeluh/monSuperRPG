//
//  Mage.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Mage: Character {
    init(name: String) {
        let spellOn = SpellOn()
        super.init(maxLife: 50, weapon: spellOn, name: name, job: "Mage")
    }
}
