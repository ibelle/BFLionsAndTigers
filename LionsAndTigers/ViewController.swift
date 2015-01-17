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
        tigerCollection += [tiger1]
        
        var tiger2 = Tiger(age: 6, name: "Tigger", breed: "Indochinese Tiger", image:UIImage(named: "IndochineseTiger.jpg"))
        tigerCollection += [tiger2]
        
        
        var tiger3 = Tiger(age: 7, name: "Jacob", breed: "Siberian Tiger", image:UIImage(named: "SiberianTiger.jpg"))
         tigerCollection += [tiger3]
        
        
        var tiger4 = Tiger(age: 8, name: "Carla", breed: "Malayan Tiger", image:UIImage(named: "MalayanTiger.jpg"))
          tigerCollection += [tiger4]
        
        return tigerCollection;
    }
    
    func setCurrentTiger(myTiger: Tiger){
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        var tigerAge=myTiger.age
        ageLabel.text = "\(tigerAge)"
        breedLabel.text = myTiger.breed
        
    }
    
}

