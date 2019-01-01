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
    init(players: Int) {
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
                        choice = ""
                        print("Comment voulez-vous appeler votre guerrier ?")
                        while loop == true || choice == ""{
                            loop = true
                            if let line = readLine() {
                                choice = line
                                loop = false
                            }
                        }
                
                        switch choice{
                        case "1":
                            characters.append(Fighter(name: choice))
                        case "2":
                            characters.append(Mage(name: choice))
                        case "3":
                            characters.append(Colossus(name: choice))
                        case "4":
                            characters.append(Dwarf(name: choice))
                        default:
                            print("Erreur : Le choix n'est pas valide")
                        }
                    }
            
            self.teams.append(Team(playerName: playerName, characters: characters))
        }
    }
}
