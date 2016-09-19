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
        case Procedures = "Procedures"
    }
    
    var segueIdentifier = TypeArt.Empty.rawValue
    
    
    @IBAction func traumaGuide(_ sender: AnyObject) {
        segueIdentifier = TypeArt.Trauma.rawValue
        performSegue(withIdentifier: segueIdentifier, sender: nil)
        //segueIdentifier = "Trauma"
        
    }
    @IBAction func adultGuide(_ sender: AnyObject) {
        //segueIdentifier = "Adult"
         segueIdentifier = TypeArt.Adult.rawValue
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
    @IBAction func pediatricGuide(_ sender: AnyObject) {
        //segueIdentifier = "Pediatric"
         segueIdentifier = TypeArt.Peds.rawValue
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
    @IBAction func obGuide(_ sender: AnyObject) {
        //segueIdentifier = "OB"
         segueIdentifier = TypeArt.OB.rawValue
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
        
    @IBAction func proceduresGuide(_ sender: AnyObject) {
        segueIdentifier = TypeArt.Procedures.rawValue
        performSegue(withIdentifier: segueIdentifier, sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

  override func performSegue(withIdentifier identifier: String, sender: Any?){
        identified = identifier
        //print("segue identifier = \(identified)")
        
    }

}
