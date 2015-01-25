//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by HUGE | Isaiah Belle on 1/11/15.
//  Copyright (c) 2015 IsaiahBelleDigital. All rights reserved.
//

import Foundation
import UIKit

struct Tiger : Printable {
    //Properties
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    var description: String {
        return "Tiger: Name-\(name), Age-\(age), Breed-\(breed), Image-\(image)"
    }
    func chuff() {
        println("Tiger: Chuff Chuff")
    }
    

    func chuffANumberOfTimes (numberOfTimes:Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
    }
    
    func chuffANumberOfTimes(numberOfTimes:Int, isLoud: Bool){
        for i in 1...numberOfTimes{
            if (isLoud){
                self.chuff()
            }else{
                println("Tiger:Purr, Purr")
            }
        }
    }
    
    //Added Mutating to this 
    func ageInTigerYearsFromAge(regularAge: Int) -> Int {
        return regularAge * 3
    }
    
    func randomFact() -> String {
        let randomNumber =  Int(arc4random_uniform(UInt32(3)))
        var randomFact:String
        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family"
        }
        else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters"
        }
        else {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        }
        return randomFact
    }
    
}