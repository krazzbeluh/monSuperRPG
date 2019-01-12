//
//  Team.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Team {
//    Team class represents the object Team. It countains the player name (playerName) and all the characters in an array (characters)
    let playerName: String
    var characters = [Character]()
    
    init(playerName: String, characters: [Character]) {
        self.playerName = playerName
        self.characters = characters
    }
    
    func isAlive() -> Bool{
//        this method returns a Bool corresponding to the team state. If team is dead (all characters  of it are dead), return false
        var alive = false
        for i in 0 ... 2 {
            if characters[i].isAlive() == true {
                alive = true
            }
        }
        return alive
    }
    
    func getStatus() -> String {
//        this method returns a String containing the team State. It calls isAlive() method
        var message = "Équipe de \(playerName) : \n"
        if isAlive() {
            for i in 0 ... 2 {
                message += characters[i].getInfos() + "\n"
            }
        } else {
            message += "L'équipe est morte, \(playerName) est éliminé\n"
        }
        return message
    }
}
