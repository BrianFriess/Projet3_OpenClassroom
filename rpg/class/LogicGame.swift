//
//  LogicGame.swift
//  rpg
//
//  Created by Brian Friess on 23/02/2021.
//

import Foundation

// we create the "Game" class which will manage the game
class LogicGame{
    
    //the "laps" property is here to check who is playing
    private(set) var laps = true
    private(set) var numberOfRound = 0
    private(set) var end = false
    let attack = Attack()
    let heal = Heal()
    let tresure = Treasure()
    
    
    //the "round" method will change laps at each round
    //true : Player 1
    //false : Player 2
    func round(){
        if laps == true{
            laps = false
        }
        else{
            laps = true
        }
        numberOfRound += 1
    }


    // the "alive" method will check if one of the champions is dead
    private func alive(_ player : Player){
        //thanks to the function "filter", we can create a new array when we call the method "alive"
        // if Character.isAlive = true, we add a new box in aliveArray
        let aliveArray =  player.character.filter { value in
            return value.isAlive
        }
        //if aliveArray is empty, all  champions are dead
        end  = aliveArray.isEmpty
    }
    
    
    func fight (_ playerOne : Player, _ playerTwo : Player){
        while end != true{
            if end == false{
                //if laps == true, the playerOne plays
                if laps == true{
                    chooseCharacters(playerOne, playerTwo, j : 1)
                    //we use round for change player
                    round()
                }
            }
            if end == false{
                //if laps == false, the playerTwo plays
                if laps == false{
                    chooseCharacters(playerTwo, playerOne,  j : 2 )
                    //we use round for change player
                    round()
                }
            }
        }
    }
    
    
    //this function will allow you to choose an action at the start of a round: choose a champion or see the stats of our champions.
    private func chooseCharacters(_ player : Player,_ suffer : Player, j : Int){
        print("\n/////PLAYER \(j)/////"
            + "\nCHOOSE YOUR CHAMPION !\n")
        // we display the champions with the method "listName"
        player.listName()
        print("4- STATS CHAMPIONS")
        print("5- SKIP THE TOUR")
        // we leave the choice to the player to choose his champion
            if let choice = readLine(){
                switch choice {
                case "1":
                    logicChoose(player, suffer, range: 0)
                case "2":
                    logicChoose(player, suffer, range: 1)
                case "3":
                    logicChoose(player, suffer, range: 2)
                case "4":
                    // if he chooses 4, we display the stats of the champions
                        for i in 1...3{
                            //we call the function for display the stats
                            player.statCharacter(range: i)
                        }
                        // and we call the method "chooseCharatcers"
                        chooseCharacters(player ,suffer, j: j)
                case "5": break
                    //if he choose 5, he skips his laps
                default:
                    print("it's necessary to choose !")
                    chooseCharacters(player ,suffer , j: j)
                }
            }
    }
    
    
    private func logicChoose(_ player : Player, _ suffer : Player, range : Int){
        //we check if the champion is alive
        if player.character[range].isAlive == true{
            // here we test if the champion has found a treasure or not.
            tresure.randomWeapon(player, range : range)
            print("\(player.character[range].name) awaits your orders")
            //we call the function for choose if the champion attacks or heals
            chooseAction(player, suffer, range: range)
        }
        // if the champion is dead, we ask to choose another champion and we call the function "chooseCharacters"
        else{
            print("\(player.character[range].name) is dead, please choose another champion\n")
            if laps == true{
                chooseCharacters(player, suffer, j : 1)
            }
            if laps == false{
                chooseCharacters(player, suffer, j : 2 )
            }
        }
    }
    
    private func chooseAction(_ player : Player,_ suffer : Player, range : Int){
        //if the chosen champion is a warrior we call the function "warriorAction"
        if let classe = player.character[range]  as? Warrior{
            warriorAction(classe, player, suffer, range)
        }
        //if the chosen champion is a farmer we call the function "farmerAction"
        if let classe = player.character[range]  as? Farmer{
            farmerAction(classe, player, suffer, range)
        }
        //if the chosen champion is a Wizard we call the function "wizardAction"
        if let classe = player.character[range]  as? Wizard{
            wizardAction(classe, player, suffer, range)
        }
        //if the chosen champion is a Heal we call the function "healAction"
        if let classe = player.character[range]  as? Healer{
            healerAction(classe, player, range, suffer)
        }
    }
    
    
    //if the chosen champion is a warrior we print "ATTACK" and we can only attack
    private func warriorAction(_ classe: Warrior, _ player: Player, _ suffer: Player, _ range: Int) {
        print("\n\(classe.name)"
                + "\n1- ATTACK")
        if let choice = readLine(){
            switch choice {
            case "1":
                chooseAttack(player, suffer, range: range)
            
            default :
                print("you must select a choice")
                chooseAction(player, suffer, range: range)
            }
        }
    }
    
    //if the chosen champion is a farmer we print "ATTACK" and we can only attack
    private func farmerAction(_ classe: Farmer, _ player: Player, _ suffer: Player, _ range: Int) {
        print("\n\(classe.name)"
                + "\n1- ATTACK")
        if let choice = readLine(){
            switch choice {
            case "1" :
                chooseAttack(player, suffer, range: range)
            
            default:
                print("you must select a choice")
                chooseAction(player, suffer, range: range)
            }
        }
    }
    
    //if the chosen champion is a Wizard we print "ATTACK" and "HEAL" and we can do the both
    private func wizardAction(_ classe: Wizard, _ player: Player, _ suffer: Player, _ range: Int) {
        print("\n\(classe.name)"
                + "\n1- ATTACK"
                + "\n2- HEAL")
        if let choice = readLine(){
            switch choice{
            case "1":
                chooseAttack(player, suffer, range: range)
            
            case "2":
                chooseHeal(player, range: range)
            
            default:
                print("you must select a choice")
                chooseAction(player, suffer, range: range)
            }
        }
    }
    
    //if the chosen champion is a Heal we print "HEAL" and we can only heal
    private func healerAction(_ classe: Healer, _ player: Player, _ range: Int, _ suffer: Player) {
        print("\n\(classe.name)"
                + "\n1- HEAL")
        if let choice = readLine(){
            switch choice{
            case "1":
                chooseHeal(player, range: range)
            
            default :
                print("you must select a choice")
                chooseAction(player, suffer, range: range)
            }
        }
    }
    
    //this function shows the enemy team and  calls the function attack in the class Attack
    private func chooseAttack(_ player : Player, _ suffer : Player, range : Int){
        suffer.listName()
        attack.attack(player, suffer, range: range)
        //after each attack, we check if the three champions are alive or not
        alive(suffer)
    }
    //this function shows our team and  calls the function heal in the class Heal
    private func chooseHeal(_ player : Player, range : Int){
        player.listName()
        heal.heal(player, range: range)
    }
    
    
    // we display all stats of all champions at the end
    private func displayEndGame(_ player : Player, _ playerTwo : Player){
        for i in 1...3{
            player.statCharacter(range: i)
        }
        for i in 1...3{
            playerTwo.statCharacter(range: i)
        }
    }
    
    
    func endGame(_ player : Player, _ playerTwo : Player){
        //if the game is over and game.laps = false, is that the player one win
        if laps == false{
            print("\nTHE FIRST PLAYER WINS THE WAR")
        }
        //if the game is over and game.laps = false, is that the player one win
        else{
            print("\nTHE SECOND PLAYER WINS THE WAR")
        }
        displayEndGame(player, playerTwo)
        print("\nThe game lasted \(numberOfRound) laps")
    }
    
}
