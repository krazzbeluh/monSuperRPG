//
//  main.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 18/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//


let game = Game(players: 2)

//for i in 1 ... 2 {
//    print("Nom du joueur 1 :")
//    while loop == true || choice == "" {
//        if let line = readLine() {
//            choice = line
//            loop = false
//        }
//    }
//    for _ in 0 ... 2 {
//        print("Quel type de guerrier voulez-vous utiliser ?"
//            + "\n1. simple combattant"
//            + "\n2. mage"
//            + "\n3. colosse"
//            + "\n4. nain")
//        var loop = true
//        var choice = ""
//        while loop == true || choice != "1" && choice != "2" && choice != "3" && choice != "4"{
//            loop = true
//            if let line = readLine() {
//                choice = line
//                loop = false
//            }
//        }
//
//        loop = true
//        choice = ""
//        print("Comment voulez-vous appeler votre guerrier ?")
//        while loop == true || choice == ""{
//            loop = true
//            if let line = readLine() {
//                choice = line
//                loop = false
//            }
//        }
//
//        switch choice{
//        case "1":
//            charactersTeam1.append(Fighter(name: choice))
//        case "2":
//            charactersTeam1.append(Mage(name: choice))
//        case "3":
//            charactersTeam1.append(Colossus(name: choice))
//        case "4":
//            charactersTeam1.append(Dwarf(name: choice))
//        default:
//            print("Erreur : Le choix n'est pas valide")
//        }
//    }
//
//    if i == 1 {
//        team1 = Team(playerName: choice, characters: charactersTeam1)
//    } else {
//        team2 = Team(playerName: choice, characters: charactersTeam2)
//    }
//}
//
//while redTeam.team[0].life > 0 || redTeam.team[1].life > 0 || redTeam.team[2].life > 0 && blueTeam.team[0].life > 0 || blueTeam.team[1].life > 0 || blueTeam.team[2].life > 0 {
//}
