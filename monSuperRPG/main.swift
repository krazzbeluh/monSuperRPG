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
    var life: Int
    let maxLife: Int
    let name: String
    let weapon: Weapon
    
    init(maxLife: Int, weapon: Weapon) {
//        When init, considering Character has all his life
        self.maxLife = maxLife
        self.life = maxLife
        
        self.weapon = weapon
        
        //Asking Chazracter name : if no answer, asking again
        print("Nom du personnage :")
        var line = readLine()!
        while line == "" {
            print("Merci de remplir le nom !")
            line = readLine()!
        }
        
        self.name = line
    }
    
    func attack(defender: Character) {
        defender.life -= self.weapon.damage
    }
}

class Fighter: Character {
    init() {
        let sword = Sword()
        super.init(maxLife: 100, weapon: sword)
    }
    
}

class Mage: Character {
    //    Bonus : The mage is able to use the function Copy / Paste Once in the game, He becomes one of the characters of the opposing team until the end of the game (It is a complete copy / paste: It takes all the properties of the opposing character
    init() {
        let spellOn = SpellOn()
        super.init(maxLife: 50, weapon: spellOn)
    }
}

class Colossus: Character {
    init() {
        let punch = Punch()
        super.init(maxLife: 1500, weapon: punch)
    }
}

class Dwarf: Character {
    init() {
        let axe = Axe()
        super.init(maxLife: 30, weapon: axe)
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
    init() {
        super.init(name: "Sort", damage: 0)
    }
}

//  This function will be usefull in the game (it makes actions for one selected team)
func action(team: Team, ennemy: Team){
    var message = ""
    for i in 0...2 {
        if team.team[i].life > 0 {
            message += "\n\(i+1). \(team.team[i].name) : \(team.team[i].life) / \(team.team[i].maxLife) PV"
        }
    }
    print("\(team.playerName), quel personnage voulez-vous utiliser ?" + message)
    
    message = ""
    for i in 0...2 {
        if ennemy.team[i].life > 0 {
            message += "\n\(i+1). \(ennemy.team[i].name) : \(ennemy.team[i].life) / \(ennemy.team[i].maxLife) PV"
        }
    }
    var line = readLine()!
    while line != "1" && line != "2" && line != "3" {
        line = readLine()!
    }
    let attacker = Int(line)!-1
    print("\(team.playerName), quel personnage souhaitez-vous attaquer ?" + message)
    line = readLine()!
    while line != "1" && line != "2" && line != "3" {
        line = readLine()!
    }
    let defender = Int(line)!-1
    team.team[attacker].attack(defender: ennemy.team[defender])
}

//
//  Game starting : Creating 2 teams, red and blue
//
var redTeam = Team(teamColor: "rouge")
print("")
var blueTeam = Team(teamColor: "bleue")


// executing fight while a team contains at least 1 alive character
var redPlayer = true
var message: String
while redTeam.team[0].life > 0 || redTeam.team[1].life > 0 || redTeam.team[2].life > 0 && blueTeam.team[0].life > 0 || blueTeam.team[1].life > 0 || blueTeam.team[2].life > 0 {
    if redPlayer == true {
        action(team: redTeam, ennemy: blueTeam)
        redPlayer = false
    } else {
        action(team: blueTeam, ennemy: redTeam)
        redPlayer = true
    }
}
