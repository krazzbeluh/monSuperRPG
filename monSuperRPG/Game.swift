//
//  Game.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Game {
    var teams = [Team]()
    let players: Int
    init(players: Int) {
        self.players = players
        for i in 1 ... players {
            let playerName: String
            var characters = [Character]()
            var choice = ""
            
//            Asking player name
            print("Nom du joueur \(i) :")
            while choice == "" {
                if let line = readLine() {
                    choice = line
                }
            }
            playerName = choice
            
//            Creating team's characters
            for _ in 0 ... 2 {
                        print("Quel type de guerrier voulez-vous utiliser ?"
                            + "\n1. simple combattant"
                            + "\n2. mage"
                            + "\n3. colosse"
                            + "\n4. nain")
                        var loop = true
                        var choice = ""
                        while loop == true || choice != "1" && choice != "2" && choice != "3" && choice != "4"{
                            loop = true
                            if let line = readLine() {
                                choice = line
                                loop = false
                            }
                        }
                
                        loop = true
                        var name = ""
                        print("Comment voulez-vous appeler votre guerrier ?")
                        while loop == true || choice == ""{
                            loop = true
                            if let line = readLine() {
                                name = line
                                loop = false
                            }
                        }
                
                        switch choice{
                        case "1":
                            characters.append(Fighter(name: name))
                        case "2":
                            characters.append(Mage(name: name))
                        case "3":
                            characters.append(Colossus(name: name))
                        case "4":
                            characters.append(Dwarf(name: name))
                        default:
                            print("Erreur : Le choix n'est pas valide")
                        }
                    }
            
            self.teams.append(Team(playerName: playerName, characters: characters))
        }
    }
    
    func attack(playerNamed: Int, defenderNamed: Int, targetNamed: Int, attackerNamed: Int) -> Int {
        let player: Int
        let defender: Int
        let target: Int
        let attacker: Int
        
//        verifying given attributes
        if playerNamed <= players {
            player = playerNamed - 1
        } else {
            return(2)
        }
        
        if defenderNamed <= players {
            defender = defenderNamed - 1
        } else {
            return(3)
        }
        
        if targetNamed - 1 <= teams[defender].characters.count {
            target = targetNamed - 1
            if (teams[defender].characters[target].life <= 0) {
                return 4
            }
        } else {
            return(4)
        }
        
        if attackerNamed - 1 <= teams[player].characters.count {
            attacker = attackerNamed - 1
            if (teams[player].characters[attacker].life <= 0) {
                return(5)
            }
        } else {
            return(5)
        }
        
//        making attack
        teams[player].characters[attacker].attack(defender: teams[defender].characters[target])
        if (teams[defender].characters[target].life <= 0) {
            teams[defender].characters[target].life = 0
            return(1)
        }
        return(0)
    }
    
    func getStatus() -> String {
        var message = ""
        var countDead = 0
        var lastAlive = ""
        for i in 0 ... players - 1 {
            if teams[i].alive == false {
                message += "\n1\(teams[i].playerName) est éliminé \n"
                countDead += 1
            } else {
                lastAlive = teams[i].playerName
                message += "\nÉquipe de \(teams[i].playerName) :\n"
                for j in 0 ... 2 {
                    message += "    \(teams[i].characters[j].job) \(teams[i].characters[j].name) => \(teams[i].characters[j].life)/\(teams[i].characters[j].maxLife)\n"
                }
            }
        }
        
        if countDead == players - 1 {
            message += "\n\n\(lastAlive) a gagné la partie !"
        }
        return message
    }
}
