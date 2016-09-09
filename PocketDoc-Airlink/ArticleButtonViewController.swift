//
//  ArticleButtonViewController.swift
//  PocketDoc-Airlink
//
//  Created by Rod Elliott-Mullens on 7/23/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit

var identified = String()

class ArticleButtonViewController: UIViewController {
    //var segueIdentifier = String()
    
    enum TypeArt:String {
        case Empty = ""
        case Trauma = "Trauma"
        case Adult = "Adult"
        case Peds = "Pediatric"
        case OB = "OB"
    }
    
    var segueIdentifier = TypeArt.Empty.rawValue
    
    
    @IBAction func traumaGuide(sender: AnyObject) {
        segueIdentifier = TypeArt.Trauma.rawValue
        performSegueWithIdentifier(segueIdentifier, sender: nil)
        //segueIdentifier = "Trauma"
        
    }
    @IBAction func adultGuide(sender: AnyObject) {
        //segueIdentifier = "Adult"
         segueIdentifier = TypeArt.Adult.rawValue
        performSegueWithIdentifier(segueIdentifier, sender: nil)
    }
    @IBAction func pediatricGuide(sender: AnyObject) {
        //segueIdentifier = "Pediatric"
         segueIdentifier = TypeArt.Peds.rawValue
        performSegueWithIdentifier(segueIdentifier, sender: nil)
    }
    @IBAction func obGuide(sender: AnyObject) {
        //segueIdentifier = "OB"
         segueIdentifier = TypeArt.OB.rawValue
        performSegueWithIdentifier(segueIdentifier, sender: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

  override func performSegueWithIdentifier(identifier: String, sender: AnyObject?){
        identified = identifier
        //print("segue identifier = \(identified)")
        
    }

}
