//
//  Characters.swift
//  rpg
//
//  Created by Brian Friess on 23/02/2021.
//

import Foundation


//creation of the class "Character"
class Character {
    var name : String
    //the property "isAlive" will be used to avoid to heal or attack a dead champion.
    //it is a computed var and while pv > 0 isAlive = true
    var isAlive : Bool{
        return pv > 0
    }
    private(set) var attack : Int
    private(set) var heal : Int
    var pv : Int
    private(set)  var classe : String
    // the property "weapon" is an instance of "Weapon" with the enumeration "AllWeapon" as a parameter
    private(set) var weapon = Weapon(weapon : AllWeapon.nothing)
    

    //we create an initializer who will initialize all property according to the name and the champion type
    init (name: String, attack : Int, heal : Int, pv : Int, weapon : Weapon, classe : String ){
        self.name = name
        self.attack = attack
        self.heal = heal
        self.pv = pv
        self.classe = classe
        self.weapon = weapon
    }
    

    // this method will be modified according to the type of champion.
    func choiceClasse(){
    }
    
    // this method will be used to check if the champion is dead or alive and return a sentence
    func statut() -> String{
        if isAlive == true{
           return ("ALIVE 😄")
        }
        else {
           return ("DEAD 💀")
        }
    }

}
