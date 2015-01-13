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
    var myTigers: [Tiger]!
    
    
    
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
       myTigers.generate()
    }
    
    func buildTigerCollection() -> [Tiger]{
        var tigerCollection:[Tiger] = [Tiger]()
        
        var tiger1 = Tiger(age: 5, name: "Tony", breed: "Bengal", image:UIImage(named: "BengalTiger.jpg"))
        tigerCollection.append(tiger1)
        
        var tiger2 = Tiger(age: 6, name: "Tigger", breed: "Indochinese Tiger", image:UIImage(named: "IndochineseTiger.jpg"))
        tigerCollection.append(tiger2)
        
        
        var tiger3 = Tiger(age: 7, name: "Jacob", breed: "Siberian Tiger", image:UIImage(named: "SiberianTiger.jpg"))
        tigerCollection.append(tiger3)
        
        
        var tiger4 = Tiger(age: 8, name: "Carla", breed: "Malayan Tiger", image:UIImage(named: "MalayanTiger.jpg"))
        tigerCollection.append(tiger4)
        
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

