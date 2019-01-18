//
//  Game.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Game {
//    Game class is the class which controls the game. It decides by itself if the game is terminated or not.
    
//    teams contains all the teams. Number of teams is the number of players. players contains the number of players in the game
    var teams = [Team]()
    let players: Int
    
    init() {
        print("Combien de joueurs serez-vous ?")
        var choice = 0
//        playing alone isn't allowed
        while choice < 2 {
            if let line = readLine() {
                choice = convertIntoInt(value: line)
                if choice == 1 {
                    print("ERREUR : Vous ne pouvez pas jouer seul !")
                }
            }
        }

        self.players = choice
        for i in 1 ... players {
            var playerName = ""
            var characters = [Character]()
            
//            Asking player name
            print("Nom du joueur \(i) :")
            while playerName == "" {
                if let line = readLine() {
                    playerName = line
                }
            }
            
//            Creating team's characters
            for _ in 1 ... 3 {
                        print("Quel type de guerrier voulez-vous utiliser ?"
                            + "\n1. simple combattant"
                            + "\n2. mage"
                            + "\n3. colosse"
                            + "\n4. nain")
                        var characterJob = ""
                        while characterJob != "1" && characterJob != "2" && characterJob != "3" && characterJob != "4"{
                            if let line = readLine() {
                                characterJob = line
                            }
                        }
                
                        var name = ""
                        print("Comment voulez-vous appeler votre guerrier ?")
                        while name == ""{
                            if let line = readLine() {
                                name = line
                            }
                        }
                
                        switch characterJob{
                        case "1":
                            characters.append(Fighter(name: name))
                        case "2":
                            characters.append(Mage(name: name))
                        case "3":
                            characters.append(Colossus(name: name))
                        case "4":
                            characters.append(Dwarf(name: name))
                        default:
                            print("Erreur : Le choix n'est pas valide")
                        }
                    }
            
            self.teams.append(Team(playerName: playerName, characters: characters))
        }
    }
    
    func attack(playerAttacking: Int, playerDefending: Int, characterTarget: Int, characterAttacker: Int) -> Bool {
//        this method makes the character attack. It calls an other method attack() in Characters class. This method is just a way to make the attack easier by giving just 4 Index (player, defendern, target and attacker)
//        verifying given attributes
        if playerAttacking > players - 1 {
            return false
        }
        
        if playerDefending > players - 1 {
            return false
        }
        
        if characterTarget - 1 <= teams[playerDefending].characters.count {
            if (teams[playerDefending].characters[characterTarget].life <= 0) {
                return false
            }
        } else {
            return false
        }
        
        if characterAttacker - 1 <= teams[playerAttacking].characters.count {
            if (teams[playerAttacking].characters[characterAttacker].life <= 0) {
                return false
            }
        } else {
            return false
        }
        
//        making attack
        teams[playerAttacking].characters[characterAttacker].attack(characterTarget: teams[playerDefending].characters[characterTarget])
        if (teams[playerDefending].characters[characterTarget].life <= 0) {
            teams[playerDefending].characters[characterTarget].life = 0
        }
        return true
    }
    
    func getStatus() -> String {
//        this method is called at the end of turn and return the game status (number of teams, are they dead ?, ...). It calls the method Team.getStatus() which return the team status
        var message = "\n"
        for i in 0 ... players - 1 {
            message += "\n" + teams[i].getStatus()
        }
        
        return message
    }
    
    func start() {
//        this method is the main method. It controls the game with a loop finishing when there is only one alive team in game
        var playerTurn = 0
        while alivePlayers() > 1 {
            
            let playerAttacking = playerTurn
            let turnCompleted: Bool
            
            if teams[playerAttacking].isAlive() {
                print("\(teams[playerAttacking].playerName), quel personnage voulez-vous utiliser ?")
                for i in 0 ... 2 {
                    print("\(i + 1). \(teams[playerAttacking].characters[i].getInfos())")
                }
                var choice = -1
                while choice == -1 {
                    if let line = readLine() {
                        choice = convertIntoInt(value: line) - 1
                    }
                    
                    if choice <= teams[playerAttacking].characters.count - 1 && choice > -1 {
                        if !teams[playerAttacking].characters[choice].isAlive() {
                            print("ERREUR : Le personnage désigné (\(teams[playerAttacking].characters[choice].name)) est déjà mort !")
                            choice = -1
                        }
                    } else {
                        print("ERREUR : Le personnage désigné n'existe pas !")
                        choice = -1
                    }
                    
                }
                let characterAttacker = choice
                
    //
    //          Creating random event (finding new chest with random weapon inside
    //
                
    //            this event only takes place once in 5
                let randomEvent = arc4random_uniform(5)
                if randomEvent == 0 {
    //                Event takes place
                    if teams[playerAttacking].characters[characterAttacker] is Mage {
                        switch arc4random_uniform(UInt32(Weapon.numberOfDifferentDefensiveWeapons)) {
                        case 0:
                            teams[playerAttacking].characters[characterAttacker].weapon = SpellOn()
                        case 1:
                            teams[playerAttacking].characters[characterAttacker].weapon = NotchApple()
                        case 2:
                            teams[playerAttacking].characters[characterAttacker].weapon = Calculator()
                        case 3:
                            teams[playerAttacking].characters[characterAttacker].weapon = PokemonCenter()
                        default:
                            print("ERROR: Generating weapon out of range")
                        }
                    } else {
                        switch arc4random_uniform(UInt32(Weapon.numberOfDifferentOffensiveWeapons)) {
                        case 0:
                            teams[playerAttacking].characters[characterAttacker].weapon = Sword()
                        case 1:
                            teams[playerAttacking].characters[characterAttacker].weapon = Axe()
                        case 2:
                            teams[playerAttacking].characters[characterAttacker].weapon = Punch()
                        case 3:
                            teams[playerAttacking].characters[characterAttacker].weapon = LightSaber()
                        case 4:
                            teams[playerAttacking].characters[characterAttacker].weapon = FlashBall()
                        default:
                            print("ERROR: Generating weapon out of range")
                        }
                    }
                    print("Oh ! Un coffre apparaît \(teams[playerAttacking].characters[characterAttacker].name) l'ouvre et y trouve une nouvelle arme : Un(e) \(teams[playerAttacking].characters[characterAttacker].weapon.name)")
                }
            
                
                let playerDefending: Int
                let characterTarget: Int
                if teams[playerAttacking].characters[characterAttacker] is Mage {
                    
                    playerDefending = playerAttacking
                    print("\(teams[playerAttacking].characters[characterAttacker].name) est un mage, vous pouvez soigner un personnage")
                    
                    for i in 0 ... 2 {
                        print("\(i + 1). \(teams[playerAttacking].characters[i].getInfos())")
                    }
                    choice = -1
                    while choice == -1 {
                        if let line = readLine() {
                            choice = convertIntoInt(value: line) - 1
                        }
                        
                        if choice <= teams[playerAttacking].characters.count {
                            if !teams[playerDefending].characters[choice].isAlive() {
                                print("ERREUR : Le personnage désigné (\(teams[playerDefending].characters[choice].name) est déjà mort !)")
                                choice = -1
                            }
                        } else {
                            print("ERREUR : Le personnage désigné n'existe pas !")
                            choice = -1
                        }
                    }
                    characterTarget = choice
                } else {
                    
                    print("\(teams[playerAttacking].playerName), quel joueur voulez-vous cibler ?")
                    for i in 1 ... players {
                        print("\(i). \(teams[i - 1].playerName)")
                    }
                    choice = -1
                    while choice == -1 {
                        if let line = readLine() {
                            choice = convertIntoInt(value: line) - 1
                        }
                        
                        if choice <= players - 1 && choice > -1 {
                            if choice == playerAttacking {
                                print("ERREUR : Vous ne pouvez pas vous attaquer vous-même !")
                                choice = -1
                            } else if !teams[choice].isAlive() {
                                print("ERREUR : Le joueur désigné (\(teams[choice].playerName)) est déjà mort !")
                                choice = -1
                            }
                        } else {
                            print("ERREUR : Le joueur désigné n'existe pas")
                            choice = -1
                        }
                    }
                    playerDefending = choice
                    
                    print("Quel personnage voulez-vous attaquer ?")
                    for i in 0 ... 2 {
                        print("\(i + 1). \(teams[playerDefending].characters[i].getInfos())")
                    }
                    choice = -1
                    while choice == -1 {
                        if let line = readLine() {
                            choice = convertIntoInt(value: line) - 1
                        }
                        
                        if choice <= teams[playerDefending].characters.count - 1 && choice > -1 {
                            if !teams[playerDefending].characters[choice].isAlive() {
                                print("ERREUR : Le personnage désigné (\(teams[playerDefending].characters[choice].name)) est déjà mort !")
                                choice = -1
                            }
                        } else {
                            print("ERREUR : Le personnage désigné n'existe pas !")
                            choice = -1
                        }
                    }
                    characterTarget = choice
                }
                if attack(playerAttacking: playerAttacking, playerDefending: playerDefending, characterTarget: characterTarget, characterAttacker: characterAttacker)   {
                    if teams[playerAttacking].characters[characterAttacker] is Mage {
                        print("\(teams[playerAttacking].playerName) soigne \(playerDefending) qui récupère \(teams[playerAttacking].characters[characterAttacker].weapon.damage) PVs grâce au mage \(teams[playerAttacking].characters[characterAttacker].name)")
                    } else {
                        print("\(teams[playerAttacking].playerName) inflige \(teams[playerAttacking].characters[characterAttacker].weapon.damage) dégats à \(teams[playerDefending].characters[characterTarget].name) avec la précieuse aide de \(teams[playerAttacking].characters[characterAttacker].name) et de son \(teams[playerAttacking].characters[characterAttacker].weapon.name)")
                        if !teams[playerDefending].characters[characterTarget].isAlive() {
                            print("\n\(teams[playerAttacking].characters[characterAttacker].name) a tué \(teams[playerDefending].characters[characterTarget].name)")
                        }
                    }
                    turnCompleted = true
                } else {
                    turnCompleted = false
                    print("ERREUR : Au moins l'une des entrées n'est pas valide")
                }
            } else {
                turnCompleted = true
                print("\(teams[playerAttacking].playerName) est éliminé, joueur suivant.")
            }
            //    switching player if there's no error
            if turnCompleted {
                playerTurn += 1
                if playerTurn > players - 1 {
                    playerTurn = 0
                }
            }
            
            print(getStatus())
        }
        print("Partier terminée !")
        
        for i in 0 ... players - 1 {
            if teams[i].isAlive() {
                print("Le vainqueur est \(teams[i].playerName) ! \n\n\(teams[i].getStatus())")
            }
        }
    }
    
    
    
    
    func alivePlayers() -> Int {
//        this method returns the number of alive players. It calls the method Team.isAlive() which returns a bool (true if the team is alive)
        var alivePlayers = 0
        for i in 0 ... players - 1 {
            if teams[i].isAlive() {
                alivePlayers += 1
            }
        }
        
        return alivePlayers
    }
}
