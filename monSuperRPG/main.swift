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

