//
//  main.swift
//  monSuperRPG
//
//  Created by Paul Leclerc on 18/12/2018.
//  Copyright © 2018 Paul Leclerc. All rights reserved.
//

func convertIntoInt(value: String) -> Int {
//    this function is just called to convert a String into an Int.
    if Int(value) != nil {
        return Int(value)!
    }
    return -1
}

// creating a new game and starting it
let game = Game()
game.start()

