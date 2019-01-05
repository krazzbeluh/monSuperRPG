//
//  main.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 18/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

func convertIntoInt(value: String) -> Int {
    if Int(value) != nil {
        return(Int(value)!)
    }
    return(-1)
}

let game = Game(players: 2)
game.start()
//var playerTurn = 1
//
//while game.teams[0].characters[0].life > 0 || game.teams[0].characters[1].life > 0 || game.teams[0].characters[2].life > 0 && game.teams[1].characters[0].life > 0 || game.teams[1].characters[1].life > 0 || game.teams[1].characters[2].life > 0 {
//
//    let player = playerTurn
//
//    print("\(game.teams[playerTurn - 1].playerName), Quel joueur voulez-vous attaquer ?")
//    for i in 1 ... game.players {
//        print("\(i). \(game.teams[i - 1].playerName)")
//    }
//    var choice = -1
//    var loop = true
//    while loop == true || choice == -1 {
//        loop = true
//        if let line = readLine() {
//            choice = convertIntoInt(value: line)
//            loop = false
//        }
//    }
//    let defender = choice
//
//    choice = -1
//    loop = true
//    while loop == true || choice == -1 {
//        loop = true
//        if let line = readLine() {
//            choice = convertIntoInt(value: line)
//            loop = false
//        }
//    }
//    let target = choice
//
//    choice = -1
//    loop = true
//    while loop == true || choice == -1 {
//        loop = true
//        if let line = readLine() {
//            choice = convertIntoInt(value: line)
//            loop = false
//        }
//    }
//    let attacker = choice
//
//    let result = game.attack(playerNamed: player, defenderNamed: defender, targetNamed: target, attackerNamed: attacker)
//    switch result {
//    case 0:
//        print("\(game.teams[player - 1].playerName) inflige \(game.teams[player - 1].characters[attacker - 1].weapon.damage) dégats à \(game.teams[defender - 1].characters[target - 1].name) avec la précieuse aide de \(game.teams[player - 1].characters[attacker - 1].name) et de son \(game.teams[player - 1].characters[attacker - 1].weapon.name)")
//    case 1:
//        print("\(game.teams[player].characters[attacker].name) a tué \(game.teams[defender])")
//    case 2:
//        print("ERREUR : Le joueur \(player) n'existe pas")
//    case 3:
//        print("ERREUR : Le joueur \(defender) n'existe pas")
//    case 4:
//        print("ERREUR : La cible spécifiée n'existe pas ou est déjà morte")
//    case 5:
//        print("ERREUR : L'attaquant spécifié n'existe pas ou est déjà mort")
//    default:
//        print("ERREUR : Erreur inconnue")
//    }
//
////    switching player if there's no error
//    if (result <= 1) {
//        playerTurn += 1
//        if playerTurn > game.players {
//            playerTurn = 1
//        }
//    }
//
//    print(game.getStatus())
//}
//print("Partie terminée")
