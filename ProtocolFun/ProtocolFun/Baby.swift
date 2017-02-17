//
//  Baby.swift
//  ProtocolFun
//
//  Created by James Campagno on 2/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

protocol BabyDelegate{
    func baby(_ baby: Baby, didGoPottyInRoom room: String)
    func baby(_ baby: Baby, justAteSomeOfThePillow amount: Int)
}

class Baby {
    
    let name: String
    var age: Int
    var isCool: Bool
    var delegate: BabyDelegate?
    var isAsleep: Bool = false
    
    init(name: String, age: Int, isCool: Bool = true) {
        self.name = name
        self.age = age
        self.isCool = isCool
    }
    
    func wentBathroom() {
        print("went bathroom")
        delegate?.baby(self, didGoPottyInRoom: "Dads Room")
        print("We are done.")
    }
    
    func ateGoodFood() {
        delegate?.baby(self, justAteSomeOfThePillow: 9)
    }
    
}









protocol TakeOutTrashPromise {
    func takeOutGarbage(numberofBags bags: Int) -> String
}

class Dog: TakeOutTrashPromise {
    
    func takeOutGarbage(numberofBags bags: Int) -> String {
        
        if bags > 5 {
            print("Tear them all up and find pizza.")
        }
        
        
        print("Ruff")
        
        return "BLLOOOOPPPP"
    }
    
}

class Alien {
    
    var name = "Frodo"
    var trashTakerOuter: TakeOutTrashPromise!
    
    func itsMonday() {
        
     let newName = trashTakerOuter.takeOutGarbage(numberofBags: 3)
    name = newName
        
    }
}

class Cat: TakeOutTrashPromise {
    
    func takeOutGarbage(numberofBags bags: Int) -> String {
        return "I dont care about anything"
    }
}










