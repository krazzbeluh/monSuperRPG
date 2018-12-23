//
//  Team.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Team {
    let teamColor: String
    let playerName: String
    var team = [Character]()
    
    init(teamColor: String) {
        self.teamColor = teamColor
        print("Création de l'équipe \(teamColor)")
        
        //Asking player name : if no answer, asking again
        print("Nom du joueur \(self.teamColor) :")
        var line = readLine()!
        while line == "" {
            print("Merci de remplir le nom !")
            line = readLine()!
        }
        
        self.playerName = line
        print("L'équipe \(self.teamColor) appartient à \(self.playerName)")
        
        //  creating team : asking which characters are wanted
        for _ in 0...2 {
            print("Quel type de guerrier voulez-vous utiliser ?"
                + "\n1. simple combattant"
                + "\n2. mage"
                + "\n3. colosse"
                + "\n4. nain")
            line = ""
            while line != "1" && line != "2" && line != "3" && line != "4" {
                print("Veuillez indiquez votre choix (1, 2, ...)")
                line = readLine()!
            }
            switch line {
            case "1":
                team.append(Fighter())
            case "2":
                team.append(Mage())
            case "3":
                team.append(Colossus())
            case "4":
                team.append(Dwarf())
            default:
                print("Erreur inconnue")
            }
            
        }
    }
}
