//
//  ButtonViewController.swift
//  SCMC ICU meds
//
//  Created by HotRod on 4/9/15.
//  Copyright (c) 2015 Rod Elliott-Mullens. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {
    
    @IBAction func callRod(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://8307089137")!)
    }
    
    @IBAction func callHelenka(sender: AnyObject) {
      UIApplication.sharedApplication().openURL(NSURL(string:"tel://5414195220")!)
    }
    @IBOutlet weak var refArticles: UIButton!
    @IBOutlet weak var refMeds: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var notesButton: UIButton!

    
    let buttonColor:UIColor = UIColor.whiteColor()
    let barColorTint:UIColor = UIColor(red:0.94, green:0.33, blue:0.31, alpha:1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this sets the navigation bar Color
        navigationController!.navigationBar.barTintColor = buttonColor
        
        //this sets the navigation bar title text color
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        //this sets the back bar button color in the navigation bar.
       navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar
        //borders()
        
        //set a pic to the background of the title bar.
        navigationController!.navigationBar.barTintColor = UIColor.clearColor()
        let image:UIImage = UIImage(named: "Header Airlink")!
        
        self.navigationController!.navigationBar.setBackgroundImage(image , forBarMetrics:.Default)
        self.navigationController!.navigationBar
        //self.title = UIFont(name: "Avenir", size: 20)
        self.title = "Airlink "
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //navigationController!.navigationBar.barTintColor = UIColor.redColor()
        
    }
    
    
}
