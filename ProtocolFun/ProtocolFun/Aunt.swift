//
//  Aunt.swift
//  ProtocolFun
//
//  Created by James Campagno on 2/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation


class Aunt: BabyDelegate {
    
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func baby(_ baby: Baby, didGoPottyInRoom room: String) {
        print("Keep going everywhere.")
    }
    
    func baby(_ baby: Baby, justAteSomeOfThePillow amount: Int) {
        print("Keep eating all the pillows.")
    }

}
