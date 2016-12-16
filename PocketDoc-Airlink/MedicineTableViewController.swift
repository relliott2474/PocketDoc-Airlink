//
//  MedicineTableViewController.swift
//  PocketDoc-Airlink
//
//  Created by HotRod on 6/16/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit


class MedicineTableViewController: UITableViewController {
    
    //var meds:Array = [Medicines]()
    var meds = [NSDictionary]()
    var cellContent = [NSArray]()
    //var filterMeds = [NSDictionary]()
    //var shouldShowSearchResults = false
    var filterMeds = [Medicines]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableData()
        self.title = "Medications"
        
    }
    
    func loadTableData(){
        let path = Bundle.main.path(forResource: "Meds List", ofType:"plist")
        cellContent = NSArray(contentsOfFile:path!) as! [NSArray] //as! [[String : String]]
        
        let filtArray:NSArray = cellContent as NSArray
        let descriptor: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let sortedResults = filtArray.sortedArray(using: [descriptor])
        meds = sortedResults as! [NSDictionary]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medsCell", for: indexPath)
        tableView.rowHeight = 50
        cell.textLabel?.text = meds[(indexPath as NSIndexPath).row]["name"]! as? String
        cell.detailTextLabel?.text = meds[(indexPath as NSIndexPath).row]["dose range"]! as? String
        return cell
        
    }


    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as! MedicineViewController
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let row = Int((indexPath as NSIndexPath).row)
        
        destinationVC.ntitle = (meds[row]["name"])! as! String
        destinationVC.ndata = (meds[row]["dose range"])! as! String
        destinationVC.ntext = (meds[row]["textinfo"])! as! String
        }
     }
    
}
