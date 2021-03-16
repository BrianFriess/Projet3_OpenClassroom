//
//  Heal.swift
//  rpg
//
//  Created by Brian Friess on 25/02/2021.
//

import Foundation
//creation of the class "Heal"
class Heal  {

    private func logicHeal(_ player : Player, range : Int, rangeFriend :Int){
        //we check if the champion is always alive
        if player.character[rangeFriend].isAlive == true{
            // if yes, the pv = heal of champion + heal of weapon
            player.character[rangeFriend].pv += player.character[range].heal + player.character[range].weapon.healWeapon
            print("\n\(player.character[range].name) given \(player.character[range].heal+player.character[range].weapon.healWeapon) PV at \(player.character[rangeFriend].name) ")
        }
        //if the champion is dead, we call the method "attack again
        else{
            print("\(player.character[rangeFriend].name) is dead, he cannot receive heal\n")
            heal(player, range: range)
        }
    }
    
     func heal(_ player : Player, range : Int){
        //we let the player choose who take the heal
        if let choice = readLine(){
            switch choice{
            case "1":
                logicHeal(player, range: range, rangeFriend: 0)
            case "2":
                logicHeal(player, range: range, rangeFriend: 1)
            case "3":
                logicHeal(player, range: range, rangeFriend: 2)
            default:
                // if the player choose an other choice, we call heal() again
                print("You must make a choice")
                heal(player, range : range)
            }
        }
    }
}
