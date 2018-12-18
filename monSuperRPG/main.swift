//
//  main.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 18/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

class Team {
    let teamColor: String
    let playerName: String
    
    init(teamColor: String) {
        self.teamColor = teamColor
        print("Création de l'équipe \(teamColor)")
        
        print("Nom du joueur \(self.teamColor) :")
        var line = readLine()!
        while line == "" {
            print("Merci de remplir le nom !")
            line = readLine()!
        }
        
        self.playerName = line
        print("L'équipe \(self.teamColor) appartient à \(self.playerName)")
    }
}

var redTeam = Team(teamColor: "rouge")
print("")
var blueTeam = Team(teamColor: "bleue")

//Mon bonus sera un mage capable d'échanger des combattants d'une équipe à l'autre
