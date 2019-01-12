//
//  Character.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
class Character {
//    this class is the ch  aracter object. It contains all the pameters used to regulate the game. life is the PVs remaining to the character, maxLife is the PVs max the character can have, name is the character's name and weapon is the weapon (it corresponds to the number of damage the character will inflict to his ennemy
    var life: Int
    let maxLife: Int
    let name: String
    var weapon: Weapon
    
    
    init(maxLife: Int, weapon: Weapon, name: String) {
        //        When init, considering Character has all his life
        self.maxLife = maxLife
        self.life = maxLife
        self.name = name
        self.weapon = weapon
    }
    
    func getInfos() -> String {
//        this method returns a String descripting the character's state.
        var message = ""
        if self is Colossus {
            message += "Colosse"
        } else if self is Dwarf {
            message += "Nain"
        } else if self is Fighter {
            message += "Simple Combattant"
        } else if self is Mage {
            message += "Mage"
        } else {
            message += "Type inconnu"
        }
        
        message += ": \(name) => \(life) / \(maxLife) PV | Arme : \(weapon.name)"
        
        if !self.isAlive() {
            message += " => Ce personnage est mort"
        }
        return message
    }
    
    func attack(defender: Character) {
//        this method is the attack action. It substract the Weapon.damage to the ennemy (defender) life.
//        if attacker is a Mage, it adds the Weapon.damage (corresponding to the PVs gain) to an allied character
        if (self.life > 0) {
            if self is Mage {
                defender.life += self.weapon.damage
                if defender.life > defender.maxLife {
                    defender.life = defender.maxLife
                }
            } else {
                defender.life -= self.weapon.damage * 5
                if defender.life <= 0 {
                    defender.life = 0
                }
            }
        } else {
            print("Erreur : Le personnage selectionné est mort")
        }
    }
    
    func isAlive() -> Bool {
//        this method returns a Bool corresponding to the character's state (true if character is alive)
        if life <= 0 {
            return false
        } else {
            return true
        }
    }
}

//All other class in this folder are different characters types and are constructed by the Character class
