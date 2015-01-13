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
    

}