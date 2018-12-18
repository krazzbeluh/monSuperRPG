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

//
// Characters creation
//
class Character {
    let life: Int
    let maxLife: Int
    let name: String
    
    init(maxLife: Int) {
//        When init, considering Character has all his life
        self.maxLife = maxLife
        self.life = maxLife
        
        //Asking Chazracter name : if no answer, asking again
        print("Nom du personnage :")
        var line = readLine()!
        while line == "" {
            print("Merci de remplir le nom !")
            line = readLine()!
        }
        
        self.name = line
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

class Weapon {
    let name: String
    let damage: Int
    
    init(name: String, damage: Int) {
        self.name = name
        self.damage = damage
    }
}

class Sword: Weapon {
    init() {
        super.init(name: "Épée", damage: 10)
    }
}

class Axe: Weapon {
    init() {
        super.init(name: "Hache", damage: 30)
    }
}

class Punch: Weapon {
    init() {
        super.init(name: "Coup de poing", damage: 3)
    }
}

class SpellOn: Weapon {
    override init(name: String, damage: Int) {
        super.init(name: name, damage: damage)
    }
}

class CopyPaste: SpellOn {
    init() {
        super.init(name: "Copier/Coller", damage: 0)
    }
}

class Treat: SpellOn {
    init() {
        super.init(name: "Soin", damage: 0)
    }
}

//
//  Game starting : Creating 2 teams, red and blue
//
var redTeam = Team(teamColor: "rouge")
print("")
var blueTeam = Team(teamColor: "bleue")

