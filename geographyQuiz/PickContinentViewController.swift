//
//  PickContinentViewController.swift
//  geographyQuiz
//
//  Created by Anna Rogers on 8/13/16.
//  Copyright © 2016 Anna Rogers. All rights reserved.
//

import UIKit

class ChoiceViewController: CoreDataController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var senderTag = [
        1: "AS",
        2: "OC",
        3: "AF",
        4: "EU",
        5: "NA",
        6: "SA"
    ]
    
    var continentChoice: String = ""
    
    @IBAction func asia(sender: AnyObject) {
        continentChoice = senderTag[sender.tag]!
        performSegueWithIdentifier("showMap", sender: nil)
    }
  
    @IBAction func africa(sender: AnyObject) {
        continentChoice = senderTag[sender.tag]!
        performSegueWithIdentifier("showMap", sender: nil)
    }
    
    @IBAction func europe(sender: AnyObject) {
        continentChoice = senderTag[sender.tag]!
        performSegueWithIdentifier("showMap", sender: nil)
    }
    
    
    @IBAction func ociania(sender: AnyObject) {
        continentChoice = senderTag[sender.tag]!
        performSegueWithIdentifier("showMap", sender: nil)
    }
    
    @IBAction func northAmerica(sender: AnyObject) {
        continentChoice = senderTag[sender.tag]!
        performSegueWithIdentifier("showMap", sender: nil)
    }
    
    @IBAction func southAmerica(sender: AnyObject) {
        continentChoice = senderTag[sender.tag]!
        performSegueWithIdentifier("showMap", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let controller = segue.destinationViewController as! MapViewContoller
            controller.continentSelected = continentChoice
        }
    }
    
    
}


