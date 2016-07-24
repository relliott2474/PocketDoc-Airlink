//
//  ArticleButtonViewController.swift
//  PocketDoc-Airlink
//
//  Created by Rod Elliott-Mullens on 7/23/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit

class ArticleButtonViewController: UIViewController {
    var segueIdentifier = String()
    
    
    @IBAction func adultGuide(sender: AnyObject) {
        segueIdentifier = "Adult"
    }
    @IBAction func pediatricGuide(sender: AnyObject) {
        segueIdentifier = "Pediatric"
    }
    @IBAction func obGuide(sender: AnyObject) {
    
        segueIdentifier = "OB"
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let segue = segue.destinationViewController as! ArticleTableViewController
        //segue.performSegueWithIdentifier(segueIdentifier, sender:nil)
        segue.segueName = segueIdentifier
        
     
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
