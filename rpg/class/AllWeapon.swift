//
//  AllWeapon.swift
//  rpg
//
//  Created by Brian Friess on 24/02/2021.
//

import Foundation



//we create an enum who content all weapons, we use "CaseIterable" for use AllWeapon like an array
enum AllWeapon :CaseIterable {
    case sword
    case wand
    case stick
    case fork
    case nothing
    case masterSword
    case rustSword
    case truthStick
    case brokeStick
    case nostraWand
    case brokeWand
    
    //the variable "attack" return all the damage for each weapon
    var attack : Int{
        switch self {
        case .sword:
            return 5
        case .wand:
            return 0
        case .stick:
            return 3
        case .fork:
            return 1
        case .nothing:
            return 0
        case .masterSword:
            return 12
        case .rustSword:
            return 3
        case .truthStick:
            return 8
        case .brokeStick:
            return 2
        case .nostraWand:
            return 0
        case .brokeWand:
            return 0
        }
    }
    //the variable "heal" return all the heal for each weapon
    var heal : Int{
        switch self{
        case .sword:
            return 0
        case .wand:
            return 5
        case .stick:
            return 3
        case .fork:
            return 0
        case .nothing:
            return 0
        case .masterSword:
            return 0
        case .rustSword:
            return 0
        case .truthStick:
            return 8
        case .brokeStick:
            return 2
        case .nostraWand:
            return 12
        case .brokeWand:
            return 3
        }
    }
    //the variable "description" return all the description for each weapon, this variable is used when we check the stat
    var description : String{
        switch self {
        case .sword:
            return "SWORD : +5 Attack"
        case .wand:
            return "WAND : +5 Heal"
        case .stick:
            return "STICK : +3 Attack / +3 Heal"
        case .fork:
            return "FORK : +1 Attack"
        case .nothing:
            return "..."
        case .masterSword:
            return "MASTER SWORD : +12 Attack"
        case .rustSword:
            return "RUST SWORD : +3 Attack"
        case .truthStick:
            return "STICK OF TRUTH : +8 Attack / +8 Heal"
        case .brokeStick:
            return "BROKE STICK : +2 Attack / +2 Heal"
        case .nostraWand:
            return "NOSTRADAMUS'S WAND : + 12 Heal"
        case .brokeWand:
            return "BROKE WAND : +3 Heal"
        }
    }
    //the variable "intro" return all the intro for each weapon, this variable is used when we find a new weapon.
    var intro : String{
        switch self {
        case .sword:
            return "you found a sword"
        case .wand:
            return "you found a wand"
        case .stick:
            return "you found a stick"
        case .fork:
            return "you found a fork"
        case .nothing:
            return "you found an empty treasure..."
        case .masterSword:
            return "!! you found a master sword !!"
        case .rustSword:
            return "you found a rust sword"
        case .truthStick:
            return "!! you found a stick of truth !!"
        case .brokeStick:
            return "you found a broke stick"
        case .nostraWand:
            return "!! you found a nostradamus's wand !!"
        case .brokeWand:
            return "you found a broke wand"
        }
    }
    
}
