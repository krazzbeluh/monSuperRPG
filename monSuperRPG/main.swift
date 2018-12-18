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
        
        //Je demande le nom du joueur, s'il ne répond rien, il doit réécrire son nom
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

// Création des personnages
class Character {
    let life: Int
    let maxLife: Int
    
    init(maxLife: Int) {
//        Lors de l'initialisation, on considère que le personnage a toute sa vie.
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
    //    Bonus : Le mage est capable d'utiliser la fonction Copier/Coller Une fois dans la partie, Il devient l'un des personnages de l'équipe adverse jusqu'à la fin de la partie (C'est un copier/coller complet : Il reprend toutes les propriétés du personnage adverse
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
//  Début de la partie, création de 2 équipes : rouge et bleue
//
var redTeam = Team(teamColor: "rouge")
print("")
var blueTeam = Team(teamColor: "bleue")

//Mon bonus sera un mage capable d'échanger des combattants d'une équipe à l'autre
