//
//  Healer.swift
//  rpg
//
//  Created by Brian Friess on 24/02/2021.
//

import Foundation


class Healer : Character{
    // we initialize attack/pv/heal/name and the first weapon of our champion if the champion is a Healer
    //for the name, we use the function "checkName" in the class "InitGame"
    //for the weapon, we use the enumeration and we take the wand
    // we use super.init because, all of the propriety are initialised in the class "Character"
    init(){
        let attack = 1
        let heal = 10
        let pv = 80
        let classe = "HEALER 🧝‍♀️"
        let weapon = Weapon(weapon: AllWeapon.wand)
        super.init(name: InitCharacter.checkName()  , attack: attack, heal: heal, pv: pv, weapon: weapon, classe: classe)
    }
    // we use override func for overload the method "choiceClasse"
    override func choiceClasse() {
        print("ready to heal you 🧝‍♀️\n")
    }

    
    
}
