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
    var myLions: [Lion] = []
    var currentTigerIndex = 0
    var currentLionIndex = 0
    
    var currentAnimal = (species:"Tiger",index:0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myTigers = buildTigerCollection()
        self.myLions  =  buildLionCollection()

        
        setCurrentAnimalToTiger(myTigers.first!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
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
    
    func buildLionCollection() -> [Lion]{
        var lionCollection: [Lion] = [Lion]()
        
        var lion1 = Lion(age: 4, isAlphaMale: false, image: UIImage(named:"Lion.jpg"), name: "Musafa", subspecies: "West Arfrican")
        var lion2 = Lion(age: 3, isAlphaMale: false, image: UIImage(named:"Lioness.jpeg"), name: "Cindy", subspecies: "Barbary")
        var lion3 = LionCub()
        lion3.age = 2
        lion3.isAlphaMale = false
        lion3.name = "Leo"
        lion3.subspecies = "Masai"
        lion3.image = UIImage(named: "LionCub1.jpg")
        lion3.rubLionCubBelly()

       // var lion4 = Lion(age: 1, isAlphaMale: false, image: UIImage(named:"LionCub2.jpg"), name: "Musafa Jr.", subspecies: "Indian")
        lion1.roar()
        lion3.changeToAlphaMale()
        println(lion1.isAlphaMale)
        lionCollection += [lion1,lion2,lion3]
        
        return lionCollection
    
    }
    
    func setCurrentAnimalToTiger(myTiger: Tiger){
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        var tigerAge=myTiger.age
        ageLabel.text = "\(tigerAge)"
        breedLabel.text = myTiger.breed
        randomFactLabel.text = myTiger.randomFact()
        randomFactLabel.hidden = false
        
    }
    
    func setCurrentAnimalToLion(myLion: Lion){
        myImageView.image = myLion.image
        nameLabel.text = myLion.name
        var lionAge=myLion.age
        ageLabel.text = "\(lionAge)"
        breedLabel.text = myLion.subspecies
        
        randomFactLabel.text = myLion.randomFact()
        myLion.roar()
        randomFactLabel.hidden = false
    }

    
    func updateView(){
        UIView.transitionWithView(self.view, duration: 1.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.setCurrentAnimalToTiger(tiger);
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.myLions[self.currentAnimal.index]
                self.setCurrentAnimalToLion(lion)
            }
        
            }, completion: {
                (finished: Bool) -> () in
        })
    }
    
    func updateAnimal (){
        switch currentAnimal {
        case ("Tiger", _) :
            var randomIndex:Int
            do{
             randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
            } while randomIndex == currentLionIndex
            
            currentLionIndex = randomIndex
            currentAnimal = ("Lion", currentLionIndex)
        default :
            var randomIndex:Int
            do{
                randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            } while randomIndex == currentTigerIndex
            currentTigerIndex = randomIndex
            currentAnimal = ("Tiger", currentTigerIndex)
        }
        println("Current Animal: \(currentAnimal)")
    }
    
}

