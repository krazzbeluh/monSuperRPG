//
//  Team.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Team {
    let playerName: String
    var characters = [Character]()
    
    init(playerName: String, characters: [Character]) {
        self.playerName = playerName
        self.characters = characters
    }
    
    func isAlive() -> Bool{
        var alive = false
        for i in 0 ... 2 {
            if characters[i].isAlive() == true {
                alive = true
            }
        }
        if alive == true {
            return(true)
        } else {
            return(false)
        }
    }
}
