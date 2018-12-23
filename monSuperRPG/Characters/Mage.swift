//
//  Mage.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Mage: Character {
    //    Bonus : The mage is able to use the function Copy / Paste Once in the game, He becomes one of the characters of the opposing team until the end of the game (It is a complete copy / paste: It takes all the properties of the opposing character
    init() {
        let spellOn = SpellOn()
        super.init(maxLife: 50, weapon: spellOn)
    }
}
