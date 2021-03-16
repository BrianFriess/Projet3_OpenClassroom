//
//  Villageois.swift
//  rpg
//
//  Created by Brian Friess on 24/02/2021.
//

import Foundation


class Farmer : Character{
    // we initialize attack/pv/heal/name and the first weapon of our champion if the champion is a farmer
    //for the name, we use the function "checkName" in the class "InitGame"
    //for the weapon, we use the enumeration and we take a fork
    // we use super.init because, all of the propriety are initialised in the class "Character"
    init(){
        let attack = 1
        let heal = 1
        let pv = 30
        let classe = "FARMER 🧑‍🌾🌾"
        let weapon = Weapon(weapon: AllWeapon.fork)
        super.init(name: InitCharacter.checkName()  , attack: attack, heal: heal, pv: pv, weapon: weapon, classe: classe)
    }
    // we use override func for overload the method "choiceClasse"
    override func choiceClasse() {
        print("... REALLY, WHY I'M HERE ?! 🧑‍🌾\n")
    }
    
}
