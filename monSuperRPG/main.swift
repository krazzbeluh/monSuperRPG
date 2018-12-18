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
        
        //Asking player name : if no answer, asking again
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

//
// Characters creation
//
class Character {
    let life: Int
    let maxLife: Int
    
    init(maxLife: Int) {
//        When init, considering Character has all his life
        self.maxLife = maxLife
        self.life = maxLife
    }
}

class Fighter: Character {
    init() {
        super.init(maxLife: 100)
    }
    
}

class Mage: Character {
    //    Bonus : The mage is able to use the function Copy / Paste Once in the game, He becomes one of the characters of the opposing team until the end of the game (It is a complete copy / paste: It takes all the properties of the opposing character
    init() {
        super.init(maxLife: 50)
    }
}

class Colossus: Character {
    init() {
        super.init(maxLife: 1500)
    }
}

class Dwarf: Character {
    init() {
        super.init(maxLife: 30)
    }
}

//
//  Creating weapons
//


//
//  Session starting : Creating 2 teams, red and blue
//
var redTeam = Team(teamColor: "rouge")
print("")
var blueTeam = Team(teamColor: "bleue")
