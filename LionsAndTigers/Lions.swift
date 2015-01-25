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
    
    
}