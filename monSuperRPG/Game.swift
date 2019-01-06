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
            for _ in 1 ... 3 {
                        print("Quel type de guerrier voulez-vous utiliser ?"
                            + "\n1. simple combattant"
                            + "\n2. mage"
                            + "\n3. colosse"
                            + "\n4. nain")
                        var characterJob = ""
                        while characterJob != "1" && characterJob != "2" && characterJob != "3" && characterJob != "4"{
                            if let line = readLine() {
                                characterJob = line
                            }
                        }
                
                        var name = ""
                        print("Comment voulez-vous appeler votre guerrier ?")
                        while name == ""{
                            if let line = readLine() {
                                name = line
                            }
                        }
                
                        switch characterJob{
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
        if playerNamed <= players - 1 {
            player = playerNamed
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
            if !teams[i].isAlive() {
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
    
    func start() {
        var playerTurn = 0
        
        while teams[0].isAlive() && teams[1].isAlive() {
            
            let player = playerTurn
            
            print("\(teams[player].playerName), Quel joueur voulez-vous attaquer ?")
            for i in 1 ... players {
                print("\(i). \(teams[i - 1].playerName)")
            }
            var choice = -1
            var loop = true
            while loop == true || choice == -1 {
                loop = true
                if let line = readLine() {
                    choice = convertIntoInt(value: line)
                    loop = false
                }
            }
            let defender = choice
            
            choice = -1
            loop = true
            while loop == true || choice == -1 {
                loop = true
                if let line = readLine() {
                    choice = convertIntoInt(value: line)
                    loop = false
                }
            }
            let target = choice
            
            choice = -1
            loop = true
            while loop == true || choice == -1 {
                loop = true
                if let line = readLine() {
                    choice = convertIntoInt(value: line)
                    loop = false
                }
            }
            let attacker = choice
            
            let result = attack(playerNamed: player, defenderNamed: defender, targetNamed: target, attackerNamed: attacker)
            switch result {
            case 0:
                print("\(teams[player].playerName) inflige \(teams[player].characters[attacker - 1].weapon.damage) dégats à \(teams[defender - 1].characters[target - 1].name) avec la précieuse aide de \(teams[player].characters[attacker - 1].name) et de son \(teams[player].characters[attacker - 1].weapon.name)")
            case 1:
                print("\(teams[player].characters[attacker - 1].name) a tué \(teams[defender - 1])")
            case 2:
                print("ERREUR : Le joueur \(player) n'existe pas")
            case 3:
                print("ERREUR : Le joueur \(defender) n'existe pas")
            case 4:
                print("ERREUR : La cible spécifiée n'existe pas ou est déjà morte")
            case 5:
                print("ERREUR : L'attaquant spécifié n'existe pas ou est déjà mort")
            default:
                print("ERREUR : Erreur inconnue")
            }
            
            //    switching player if there's no error
            if (result <= 1) {
                playerTurn += 1
                if playerTurn > players - 1 {
                    playerTurn = 0
                }
            }
            
            print(getStatus())
        }
        print("Partier terminée !")
    }
}
