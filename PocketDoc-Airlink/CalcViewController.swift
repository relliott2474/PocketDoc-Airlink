//
//  CalcViewController.swift
//  PocketDoc-Airlink
//
//  Created by Rod Elliott-Mullens on 4/4/17.
//  Copyright © 2017 Rod. All rights reserved.
//


import UIKit
import UserNotifications

class CalcViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    var isGrantedNotificationAccess = false
    var hgt2 = Double()
    var inches = Int()
    
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var bodyWeight: UILabel!
    
    @IBOutlet weak var tidalVolume: UILabel!
    
    @IBOutlet weak var ketamineDose: UILabel!
    
    @IBOutlet weak var etomidateDose: UILabel!
    
    @IBOutlet weak var rocuroniumDose: UILabel!
    
    @IBOutlet weak var succsDose: UILabel!
    
    @IBOutlet weak var Male: UISegmentedControl!
   
    
    @IBAction func calcButton(_ sender: Any) {
        let i = height.text
        
        if i! == "" || Int(i!)! == 0 {
            print("need to add height")
            tidalVolume.text = ""
            bodyWeight.text = ""
            setNotification()
        }
            
        else {
            inches = Int(i!)!
            Calculate(inches: inches)
            //height.text = String(inches) + " inches"
        }
        textFieldDoneEditing(sender: height)
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.sound,.badge],
            completionHandler: { (granted,error) in
                self.isGrantedNotificationAccess = granted
                if !granted{
                    //add alert to complain
                }
        })
        
        //didChangeValue()
        UNUserNotificationCenter.current().delegate = self
        height.keyboardType = UIKeyboardType.numberPad
        
        
    }
    
    func Calculate(inches:Int) {
        
        if Male.selectedSegmentIndex == 0{
            //("male")
            let hgt = inches
            let hgt2:Double = Double(100 + ((hgt - 60) * 7)) / 2.2
            calculations(hgt2: hgt2)
            let HighVT = Int(hgt2 * 8)
            let LowVT = Int(hgt2 * 6)
            //print("starting tidal volume = \(HighVT)cc")
            //print("ideal body weight = \(Int(hgt2))kg")
            let hgt4 = (Int(hgt2))
            let hgtWeight = String(hgt4)
            bodyWeight.text = hgtWeight + "kg"
            tidalVolume.text = String(LowVT) + "cc - " + String(HighVT) + "cc"
            
        }else if Male.selectedSegmentIndex == 1{
            //female short
            let hgt = inches
            if hgt < 60 {
                let hgt2:Double = Double( 100 - (( 60 - hgt) * 5)) / 2.2
                calculations(hgt2: hgt2)
                let hgt3 = Int(hgt2 * 8)
                let LowVT = Int(hgt2 * 6)
                let hgt4 = (Int(hgt2))
                let hgtWeight = String(hgt4)
                bodyWeight.text = hgtWeight + "kg"
                let hgtTidal = String(hgt3)
                tidalVolume.text = String(LowVT) + "cc - " + String(hgtTidal) + "cc"
            }
            else{
                //female tall
                let hgt2:Double = Double(100 + ((hgt - 60) * 5)) / 2.2
                calculations(hgt2: hgt2)
                let hgt3 = Int(hgt2 * 8)
                let LowVT = Int(hgt2 * 6)
                let hgt4 = (Int(hgt2))
                let hgtWeight = String(hgt4)
                bodyWeight.text = hgtWeight + "kg"
                let hgtTidal = String(hgt3)
                tidalVolume.text = String(LowVT) + "cc - " + String(hgtTidal) + "cc"
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let alert = UIAlertController(title: notification.request.content.title, message: notification.request.content.body, preferredStyle: .alert)
        let okAction = UIAlertAction(
            title:"Ok",
            style:.default,
            handler:nil)
        
        alert.addAction(okAction)
        present(alert,animated:true, completion:nil)
        
    }
    
    func setNotification() {
        if isGrantedNotificationAccess{
            //set content
            let content = UNMutableNotificationContent()
            content.title = "Error in data."
            content.subtitle = "error"
            content.body = "Please enter a height in inches."
            content.categoryIdentifier = "message"
            
            //set trigger
            let trigger = UNTimeIntervalNotificationTrigger(
                timeInterval: 0.1,
                repeats: false)
            
            //Create the request
            let request = UNNotificationRequest(
                identifier: "my.notification",
                content: content,
                trigger: trigger
            )
            //Schedule the request
            UNUserNotificationCenter.current().add(
                request, withCompletionHandler: nil)
        }
    }
    
    func calculations(hgt2:Double){
        let height = hgt2
        succsDose.text = String(Int(height * 1.5)) + "mg"
        ketamineDose.text = String(Int(height * 1.5 )) + "mg"
        etomidateDose.text = String(Int(height * 0.3)) + "mg"
        rocuroniumDose.text = String(Int(height * 2)) + "mg"
        
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()}
    
}

