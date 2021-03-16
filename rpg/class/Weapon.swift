//
//  Weapon.swift
//  rpg
//
//  Created by Brian Friess on 24/02/2021.
//

import Foundation


//we create the class "Weapon"
class Weapon{
    // we define the property attackWeapon / healWeapon and Weapon
    private(set) var attackWeapon = 0
    private(set) var healWeapon = 0
    // the property weapon is of type "AllWeapon"
    var weapon : AllWeapon{
        didSet{
            //when weapon change, attackWeapon and healWeapon change too thaks to didset
            self.attackWeapon = weapon.attack
            self.healWeapon = weapon.heal
        }
    }
    
    //we use the initialization to define the attack and the heal when we initlize the champion
    init(weapon : AllWeapon){
        self.weapon = weapon
        self.attackWeapon = weapon.attack
        self.healWeapon = weapon.heal
    }
}
