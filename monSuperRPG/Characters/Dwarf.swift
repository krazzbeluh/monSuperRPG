//
//  Dwarf.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Dwarf: Character {
    init(name: String) {
        let axe = Axe()
        super.init(maxLife: 30, weapon: axe, name: name, job: "Nain")
    }
}
