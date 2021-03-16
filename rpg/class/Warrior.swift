//
//  Warrior.swift
//  rpg
//
//  Created by Brian Friess on 23/02/2021.
//

import Foundation


class Warrior : Character {
    // we initialize attack/pv/heal/name and the first weapon of our champion if the champion is a warrior
    //for the name, we use the function "checkName" in the class "InitGame"
    //for the weapon, we use the enumeration and we take the sword
    // we use super.init because, all of the propriety are initialised in the class "Character"
    init(){
        let attack = 10
        let heal = 1
        let pv = 120
        let classe = "WARRIOR ⚔️"
        let weapon = Weapon(weapon: AllWeapon.sword)
        super.init(name: InitCharacter.checkName() , attack: attack, heal: heal, pv: pv, weapon: weapon , classe: classe)
    }
    // we use override func for overload the method "choiceClasse"
    override func choiceClasse() {
        print("FIGHT!⚔️\n")
    }
    

}
