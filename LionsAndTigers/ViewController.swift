//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by HUGE | Isaiah Belle on 1/11/15.
//  Copyright (c) 2015 IsaiahBelleDigital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers: [Tiger] = []
    var currentTigerIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTigers = buildTigerCollection()
        
        println(myTigers)
        
        for (tiger) in myTigers {
            println("My Tiger is Named \(tiger.name) his breed is \(tiger.breed)")
        }
        
        
        setCurrentTiger(myTigers.first!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        var randomNumber:Int
        do{
            randomNumber = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while randomNumber == currentTigerIndex
      currentTigerIndex = randomNumber
      var nextTiger = myTigers[currentTigerIndex]
             
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                self.setCurrentTiger(self.myTigers[randomNumber])
            },
            completion: {
                (finished: Bool) -> () in
        })
    }
    
    func buildTigerCollection() -> [Tiger]{
        var tigerCollection:[Tiger] = [Tiger]()
        
        var tiger1 = Tiger(age: 5, name: "Tony", breed: "Bengal", image:UIImage(named: "BengalTiger.jpg"))
        tiger1.chuffANumberOfTimes(1, isLoud:false)
        tiger1.age=tiger1.ageInTigerYearsFromAge(tiger1.age)
        tigerCollection += [tiger1]
        
        var tiger2 = Tiger(age: 6, name: "Tigger", breed: "Indochinese Tiger", image:UIImage(named: "IndochineseTiger.jpg"))
         tiger2.age=tiger2.ageInTigerYearsFromAge(tiger2.age)
        tigerCollection += [tiger2]
        
        
        
        var tiger3 = Tiger(age: 7, name: "Jacob", breed: "Siberian Tiger", image:UIImage(named: "SiberianTiger.jpg"))
         tiger3.age=tiger3.ageInTigerYearsFromAge(tiger3.age)
        tigerCollection += [tiger3]
        
        
        var tiger4 = Tiger(age: 8, name: "Carla", breed: "Malayan Tiger", image:UIImage(named: "MalayanTiger.jpg"))
        tiger4.age=tiger4.ageInTigerYearsFromAge(tiger4.age)

        tigerCollection += [tiger4]
        
        return tigerCollection;
    }
    
    func setCurrentTiger(myTiger: Tiger){
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        var tigerAge=myTiger.age
        ageLabel.text = "\(tigerAge)"
        breedLabel.text = myTiger.breed
        randomFactLabel.text = myTiger.randomFact()
        randomFactLabel.hidden = false
        
    }
    
}

