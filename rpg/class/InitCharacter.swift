//
//  InitCharacter.swift
//  rpg
//
//  Created by Brian Friess on 23/02/2021.
//

import Foundation


class InitCharacter{
    //this function is used to initialize a playerOne and playerTwo array with 3 champions
    // we use "inout" for the parameter "player" because we add boxes to the table "player"
    private func createCharacter(_ player : inout Player, i : Int){
        print("\n////////"
            + "PLAYER \(i)"
            + "////////")
        //we create a loop to create 3 boxes in the array and give a name and a class to each champion
        for i in 1...3{
            print("\nCLASS OF YOUR HERO N°\(i) :"
                + "\n1- WARRIOR⚔️ - A lot of strength but can't heal - PV : 120"
                + "\n2- HEALER🧝‍♀️ - a lot of heal but can't attack - PV : 80 "
                + "\n3- WIZARD🧙‍♂️ - balanced attack and heal - PV : 100"
                + "\nother - FARMER🧑‍🌾 - very weak and can't heal, not recommended - PV : 30")
            if let choice = readLine(){
                switch choice{
                case "1":
                    //we give a class and a name to each champion
                    print(" CHAMPION'S NAME N° \(i)")
                    player.character.append(Warrior())
                case "2":
                    print(" CHAMPION'S NAME N° \(i)")
                    player.character.append(Healer())
                case "3":
                    print(" CHAMPION'S NAME N° \(i)")
                    player.character.append(Wizard())
                default:
                    print(" FARMER'S NAME... N° \(i)")
                    player.character.append(Farmer())
                // if the choice is any other than 1 - 2 - 3 then the champion is a farmer
                }
            }
            // we use the function "verifNameEmpty" for check if the name is empty or not
            verifNameEmpty(player, range: i)
        }
    //we check if the players have the same name for several champions
    sameNameinArray(player)
    }

    //we create a function for enter a name
    static func checkName() -> String{
        if let name = readLine(){
            return name
        }
        return ("invalid name")
    }
    
    
    // we create a function to check that there is indeed a name for the champion
    private func verifNameEmpty(_ player : Player, range : Int){
        while player.character[range-1].name == ""{
            //While the name is empty, we call the function checkname
            print("please enter a name")
            player.character[range-1].name = InitCharacter.checkName()
        }
    }
    
    
    //we create the function sameNameInArray which check if we have the same name in the same array
    private func sameNameinArray( _ player : Player){
        // this loop will check the integrity of the other 2 loops and avoid renaming, for example, name 2 as name 1.
        while player.character[0].name == player.character[1].name || player.character[0].name == player.character[2].name || player.character[1].name == player.character[2].name{
            // this loop will check if name 1 is equal to name 2 or 3, if so, it will ask to change name n ° 1.
            while player.character[0].name == player.character[1].name || player.character[0].name == player.character[2].name{
                print("\nthere are too much of \(player.character[0].name) in this team!"
                    + "\n New name of champion n° 1 :")
                player.character[0].name = InitCharacter.checkName()
                //we call the function "verifNameEmpty"
                verifNameEmpty(player, range: 1)
            }
            // this loop will check if the name 2 is equal to the name 3 if yes, it will ask to modify the name 2.
            while player.character[1].name == player.character[2].name{
                print("\nthere are too much of \(player.character[1].name) in this team!"
                    + "\n New name of champion n° 2 :")
                player.character[1].name = InitCharacter.checkName()
                //we call the function "verifNameEmpty"
                verifNameEmpty( player, range: 2)
            }
        }
    }



    // this function will compare the 2 arrays
    private func sameNameInTwoArray(_ player : Player, _ playerTwo : Player){
        // we create a loop with the 1st array which at each turn will read the full content of the 2nd array
        for i in player.character{
            for j in playerTwo.character{
                // if we find identical names, we create a loop to rename the champion of player 1 time that the name is identical
                if i.name == j.name{
                    while i.name == j.name{
                    print("\nTwo players took the same names \(j.name)"
                        + "\n\nPLAYER 1 please change the name of \(j.name)")
                        i.name = InitCharacter.checkName()
                        //we call the function sameNameinArray
                        sameNameinArray(player)
                        // we check again the name in the two arrays
                        sameNameInTwoArray(player, playerTwo)
                    }
                }
            }
        }
    }
    
    //we create a function to display all of champions at the start of the game
    private func displayCharacter(_ player : Player, i : Int){
        print("\n🗡PLAYER \(i)🏹 ")
        for i in 1...3{
            player.statCharacter(range: i)
            player.character[i-1].choiceClasse()
        }
    }
    
    func startGame(_ playerOne : inout Player, _ playerTwo : inout Player){
        // we initialize the 3 champions of the 2 players
        createCharacter(&playerOne, i: 1)
        createCharacter(&playerTwo, i: 2)
        // we check if we don't have the same names in the two arrays with the method "sameNameInTwoArray" in the class "InitGame"
        sameNameInTwoArray(playerOne, playerTwo)
        //we display the name of champions of each player
        displayCharacter(playerOne, i: 1)
        displayCharacter(playerTwo, i: 2)
    }
    
    
    
}
