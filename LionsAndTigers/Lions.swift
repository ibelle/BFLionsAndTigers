//
//  Lions.swift
//  LionsAndTigers
//
//  Created by HUGE | Isaiah Belle on 1/24/15.
//  Copyright (c) 2015 IsaiahBelleDigital. All rights reserved.
//
import UIKit

import Foundation
class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named:"")
    var name = ""
    var subspecies = ""
    
    init(){}

    init(age:Int, isAlphaMale: Bool, image: UIImage, name:String,subspecies:String){
        self.age=age
        self.isAlphaMale=isAlphaMale
        self.image=image
        self.name=name
        self.subspecies=subspecies
    }
    
    func roar () {
        println("Lion: Roar Roar")
    }
    
    func changeToAlphaMale () {
        self.isAlphaMale = true
    }
    
    func randomFact() ->String{
        var randomFact:String
        if self.isAlphaMale {
        randomFact = "Male lions are easy to recognize thanks to their distinctive manes. Males with darker manes are more likely to attract females."
        }else{
            randomFact = "Female Lionesses form the stable social unit and do not tolerate outside females."
        }
        return randomFact
    }
    
    
}

class LionCub: Lion {
    func rubLionCubBelly(){
        println("Snuggle and Be Happy")
    }
    
   override func roar() {
        super.roar()
        println("LionCub: Growl, Growl!")
    }
    
    override func randomFact() -> String {
        var randomFactString:String
        
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFactString
    }
    
}