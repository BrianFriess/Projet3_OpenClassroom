//
//  Game.swift
//  rpg
//
//  Created by Brian Friess on 10/03/2021.
//

import Foundation

class Game {
    
    private(set) var playerOne = Player()
    private(set) var playerTwo = Player()
    let logicGame = LogicGame()
    let startGame = InitCharacter()
    
    func game(){
        // we initialize the 3 champions of the 2 players
        startGame.startGame(&playerOne, &playerTwo)
            
        
        //we call the function whoPlay
        logicGame.fight(playerOne, playerTwo)
        
        
        //we call the function endGame
        logicGame.endGame(playerOne, playerTwo)
    }
        

}
