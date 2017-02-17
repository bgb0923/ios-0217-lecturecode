//
//  Mom.swift
//  ProtocolFun
//
//  Created by James Campagno on 2/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation


class Mom: BabyDelegate {
    
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func baby(_ baby: Baby, didGoPottyInRoom room: String) {
        if room == "Living Room" {
            print("Bad \(baby.name)")
            print("Go to your room.")
        }
        
        if room == "Dads Room" {
            print("Good job.")
        }
        
        baby.isAsleep = true
        
    }
    
    
    func baby(_ baby: Baby, justAteSomeOfThePillow amount: Int) {
        if amount > 5 {
            print("Call ambulance.")
        }
        
        print("Stop eating pillows.")
    }
    
}










