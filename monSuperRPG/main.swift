//
//  main.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 18/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//


let game = Game(players: 2)
var playerTurn = 1

while game.teams[0].characters[0].life > 0 || game.teams[0].characters[1].life > 0 || game.teams[0].characters[2].life > 0 && game.teams[1].characters[0].life > 0 || game.teams[1].characters[1].life > 0 || game.teams[1].characters[2].life > 0 {
    
    let player = 1
    let defender = 2
    let target = 1
    let attacker = 3
    
    let result = game.attack(playerNamed: player, defenderNamed: defender, targetNamed: target, attackerNamed: attacker)
    switch result {
    case 0:
        print("\(game.teams[player].playerName) inflige \(game.teams[player].characters[attacker].weapon.damage) dégats à \(game.teams[defender].characters[target].name) avec la précieuse aide de \(game.teams[player].characters[attacker].name) et de son \(game.teams[player].characters[attacker].weapon.name)")
    case 1:
        print("\(game.teams[player].characters[attacker].name) a tué \(game.teams[defender])")
    case 2:
        print("ERREUR : Le joueur \(player) n'existe pas")
    case 3:
        print("ERREUR : Le joueur \(defender) n'existe pas")
    case 4:
        print("ERREUR : La cible spécifiée n'existe pas ou est déjà morte")
    case 5:
        print("ERREUR : L'attaquant spécifié n'existe pas ou est déjà mort")
    default:
        print("ERREUR : Erreur inconnue")
    }
    
//    switching player if there's no error
    if (result <= 1) {
        playerTurn += 1
        if playerTurn > game.players {
            playerTurn = 1
        }
    }
}
print("Partie terminée")
