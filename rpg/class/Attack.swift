//
//  Attack.swift
//  rpg
//
//  Created by Brian Friess on 25/02/2021.
//

import Foundation
//creation of the class "Attack"
class Attack {

    private func logicAttack(_ player : Player, _ suffer : Player, range : Int, rangeSuffer : Int){
        //we check if the champion is always alive
        if suffer.character[rangeSuffer].isAlive == true{
            // if yes, his pv = his pv less the attack of champion and attack of weapon
            suffer.character[rangeSuffer].pv -= (player.character[range].attack + player.character[range].weapon.attackWeapon)
            print("\n\(player.character[range].name) remove \(player.character[range].attack + player.character[range].weapon.attackWeapon) PV at \(suffer.character[rangeSuffer].name) ")
        }
        //if the champion is dead, we call the method "attack again
        else {
            print("you can't attack a corpse !")
            attack(player,suffer, range: range)
        }
    }
    
    func attack(_ player : Player, _ suffer : Player, range : Int){
        //we let the player choose who suffer the attack
        if let choice = readLine(){
            switch choice{
            case "1":
                logicAttack(player, suffer, range: range, rangeSuffer: 0)
            case "2":
                logicAttack(player, suffer, range: range, rangeSuffer: 1)
            case "3":
                logicAttack(player, suffer, range: range, rangeSuffer: 2)
            default:
                // if the player choose an other choice, we call attack() again
                print("You must make a choice")
                attack(player,suffer, range : range)
            }
        
        }
    }
}
