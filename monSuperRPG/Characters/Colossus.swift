//
//  Colossus.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Colossus: Character {
    init(name: String) {
        let punch = Punch()
        super.init(maxLife: 500, weapon: punch, name: name)
    }
    
    override func getCharacterName() -> String {
        return "Colosse"
    }
}
