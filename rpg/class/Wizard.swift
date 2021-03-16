//
//  Wizard.swift
//  rpg
//
//  Created by Brian Friess on 24/02/2021.
//

import Foundation


class Wizard : Character{
    // we initialize attack/pv/heal/name and the first weapon of our champion if the champion is a wizard
    //for the name, we use the function "checkName" in the class "InitGame"
    //for the weapon, we use the enumeration and we take a stick
    // we use super.init because, all of the propriety are initialised in the class "Character"
    init(){
        let attack = 5
        let heal = 5
        let pv = 100
        let classe = "WIZARD 🧙‍♂️"
        let weapon = Weapon(weapon: AllWeapon.stick)
        super.init(name: InitCharacter.checkName() , attack: attack, heal: heal, pv: pv, weapon: weapon, classe: classe)
    }
    // we use override func for overload the method "choiceClasse"
    override func choiceClasse() {
        print("My magic is at your service 🧙‍♂️\n")
    }
    


}
