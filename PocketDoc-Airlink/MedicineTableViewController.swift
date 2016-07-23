//
//  MedicineTableViewController.swift
//  PocketDoc-Airlink
//
//  Created by HotRod on 6/16/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit

class MedicineTableViewController: UITableViewController, UISearchBarDelegate {
    var meds = [NSDictionary]()
    var cellContent = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableData()
        self.title = "Medications"
    
    }
    func loadTableData(){
        let path = NSBundle.mainBundle().pathForResource("Meds List", ofType:"plist")
        cellContent = NSArray(contentsOfFile:path!)!
        //print("loaded cell content is \(cellContent)")
        let descriptor: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let sortedResults: NSArray = cellContent.sortedArrayUsingDescriptors([descriptor])
        meds = sortedResults as! [NSDictionary]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meds.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("medsCell", forIndexPath: indexPath)
        tableView.rowHeight = 50
        cell.textLabel?.text = meds[indexPath.row]["name"] as? String
        cell.detailTextLabel?.text = meds[indexPath.row]["dose range"] as? String
        // Configure the cell...

        return cell
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        //dismiss keyboard
        searchBar.resignFirstResponder()
        //reload table data
        
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        //self.loadObjects()
    }
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        //dismiss
        searchBar.resignFirstResponder()
        //self.loadObjects()
    }
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        //self.loadObjects()
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        //let text = searchText.text
    }

    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        let destinationVC = segue.destinationViewController as! MedicineViewController
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let row = Int(indexPath.row)
        
        destinationVC.ntitle = (meds[row]["name"]) as! String
        destinationVC.ndata = (meds[row]["dose range"]) as! String
        destinationVC.ntext = (meds[row]["textinfo"]) as! String
        }
     }
    
}
