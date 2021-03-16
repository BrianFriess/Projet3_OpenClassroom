//
//  Player.swift
//  rpg
//
//  Created by Brian Friess on 25/02/2021.
//

import Foundation
//creation of the class "Player"
class Player {
    
    var character = [Character]()
    
    // this method will be used to display the statistics of his team
    func statCharacter(range : Int){
        print("\nCHAMPION N°\(range) : \(character[range-1].name)"
            + "\nCLASS : \(character[range-1].classe)"
            + "\nAttack 💪 : \(character[range-1].attack)"
            + "\nHeal ✨ : \(character[range-1].heal)"
            + "\nPV ❤️ : \(character[range-1].pv)"
            + "\nWeapon ⚔️ : \(character[range-1].weapon.weapon.description)"
            + "\nStatus ☠️ : \(character[range-1].statut())" )
    }
    
    // this function is used to list champions by name before choosing an action.
    func listName (){
        for i in 1...3{
            //if the champions are alive, we write their names
            if character[i-1].isAlive == true{
                print("\(i)- \(character[i-1].name)")
            }
            //else, we write their names with emojis
            else{
                print("🪦💀\(character[i-1].name)💀🪦")
            }
        }
    }
}
