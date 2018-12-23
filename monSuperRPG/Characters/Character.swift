//
//  Character.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 24/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

import Foundation
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
        print("0")
        if (self.life > 0) {
            print("1")
            defender.life -= self.weapon.damage
            if defender.life <= 0 {
                defender.life = 0
            }
        } else {
            print("Erreur : Le personnage selectionné est mort")
        }
    }
}
