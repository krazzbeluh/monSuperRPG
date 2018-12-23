//
//  main.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 18/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//



//
// Characters creation
//










//
//  Creating weapons
//











//  This function will be usefull in the game (it makes actions for one selected team)
func action(team: Team, ennemy: Team){
    var message = ""
    for i in 0...2 {
        message += "\n\(i+1). \(team.team[i].name) : \(team.team[i].life) / \(team.team[i].maxLife) PV"
        if team.team[i].life <= 0 {
            message += " => mort"
        }
    }
    print("\(team.playerName), quel personnage voulez-vous utiliser ?" + message)
    var line = readLine()!
    var check = false
    var attacker = 0
    while check == false {
        while line != "1" && line != "2" && line != "3" {
            line = readLine()!
        }
        attacker = Int(line)!-1
        if team.team[attacker].life > 0 {
            check = true
        } else {
            print("Veuillez choisir un personnage vivant")
            line = ""
        }
    }
    
    message = ""
    for i in 0...2 {
        message += "\n\(i+1). \(ennemy.team[i].name) : \(ennemy.team[i].life) / \(ennemy.team[i].maxLife) PV"
        if ennemy.team[i].life <= 0 {
            message += " => Ce personnage est mort"
        }
    }
    print("\(team.playerName), quel personnage souhaitez-vous attaquer ?" + message)
    line = readLine()!
    check = false
    while check == false {
        while line != "1" && line != "2" && line != "3" {
            line = readLine()!
        }
        let defender = Int(line)!-1
        if (ennemy.team[defender].life > 0) {
            team.team[attacker].attack(defender: ennemy.team[defender])
            check = true
        } else {
            print("Veuillez choisir un personnage vivant")
            line = ""
        }
    }
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
        print("\u{001B}[0;31m")
        action(team: redTeam, ennemy: blueTeam)
        redPlayer = false
    } else {
        print("\u{001B}[0;34m")
        action(team: blueTeam, ennemy: redTeam)
        redPlayer = true
    }
}
