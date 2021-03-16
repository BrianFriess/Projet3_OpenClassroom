//
//  Tresure.swift
//  rpg
//
//  Created by Brian Friess on 24/02/2021.
//

import Foundation


//we creat the class "Treasure", this class is used to find a random weapon
class Treasure{
    
    private func findWeapon(index : Int, _ player : Player, range : Int){
        //we can use allCases thanks to caseIterable for choose a weapon
        let weapon = AllWeapon.allCases[index]
        print("\(weapon.intro)"
            + "\nYour weapon : \(player.character[range].weapon.weapon.description)"
            + "\nWeapon found : \(weapon.description)"
            + "\ntake the Weapon ?"
            + "\n 1- Yes"
            + "\n Other- No")
        if let choice = readLine(){
            //if the player choose 1, his weapon and his stats are replaced
            if choice == "1"{
                player.character[range].weapon.weapon = weapon
                print("\nYour take your new weapon")
            }
           else {
                //else, the player keep his weapon
                print("\nYou let the new weapon")
            }
        }
    }
    
    //we create a function to be able to change the weapon and the stats of the champion
        func randomWeapon(_ player : Player, range : Int){
        // here we create two random numbers
        let randomTresure = Int.random(in : 0...1)
        let randomWeapon = Int.random(in: 0...9)
        
        // if randomTresure == 1, we find a tresure
        if randomTresure == 1{
            //we call the method "findWeapon"
            findWeapon(index : randomWeapon, player , range: range)
        }
    }
}
